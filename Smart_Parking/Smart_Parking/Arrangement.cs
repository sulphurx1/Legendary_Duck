using Org.BouncyCastle.Asn1.X509;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Security.Cryptography.X509Certificates;

namespace Smart_Parkiing
{
    public class Reservation
    {
        public string EID1 { get; set; }
        public TimeSpan ArrivalTime { get; set; }
        public TimeSpan DepartureTime { get; set; }
        public string ProjectName { get; set; }
        public string Date { get; set; }
    }

    public class Employee
    {
        public string EID2 { get; set; }
        public string Project { get; set; }
    }

    public class Parking
    {
        public string Location { get; set; }
        public string SlotName { get; set; }
        public int Availability { get; set;  }
    }

    public class ParkingAssign
    {
        public string DayName { get; set; }
        public string Date { get; set; }
        public string SlotName { get; set; }
        public string Location { get; set; }
        public TimeSpan TimeIn { get; set; }
        public TimeSpan TimeOut { get; set; }
        public string Status { get; set; }

        public ParkingAssign()
        {
            Status = "Pending";
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            List<Reservation> reservations = new List<Reservation>();
            List<Employee> employees = new List<Employee>();
            List<Parking> parkings = new List<Parking>();
            List<ParkingAssign> parkingassigns = new List<ParkingAssign>();

            string connectionString = "Data Source=DESKTOP-5N7T2MK\\SQLEXPRESS;Initial Catalog=tazskin_retard;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectionString);

            connection.Open();

            DateTime tomorrow = DateTime.Today.AddDays(1);
            string queryString1 = "SELECT employee_id, reservation_time_in, reservation_time_out, reservation_date FROM reservation WHERE reservation_date = @Date";
            string queryString2 = "SELECT employee_id, employee_project FROM employee";
            string queryString3 = "SELECT * FROM parking_slots";

            SqlCommand command1 = new SqlCommand(queryString1, connection);
            SqlCommand command2 = new SqlCommand(queryString2, connection);
            SqlCommand command3 = new SqlCommand(queryString3, connection);

            command1.Parameters.AddWithValue("@Date", tomorrow);

            using SqlDataReader reader1 = command1.ExecuteReader();
            using SqlDataReader reader2 = command2.ExecuteReader();
            using SqlDataReader reader3 = command3.ExecuteReader();

            while (reader1.Read() && reader2.Read() && reader3.Read())
            {
                Reservation reservation = new Reservation();
                reservation.EID1 = reader1.GetString(0);
                reservation.ArrivalTime = reader1.GetTimeSpan(1);
                reservation.DepartureTime = reader1.GetTimeSpan(2);
                reservation.Date = reader1.GetString(3);

                reservations.Add(reservation);

                Employee employee = new Employee();
                employee.EID2 = reader2.GetString(0);
                employee.Project = reader2.GetString(1);

                employees.Add(employee);

                Parking parking = new Parking();
                parking.Location = reader3.GetString(0);
                parking.SlotName = reader3.GetString(1);
                parking.Availability = reader3.GetInt16(2);

                parkings.Add(parking);
            }

            connection.Close();

            foreach (Reservation reservation in reservations)
            {
                foreach (Employee employee in employees)
                {
                    if (reservation.EID1 == employee.EID2)
                    {
                        reservation.ProjectName = employee.Project;
                    }
                }
            }

            var reservationByProject = reservations.GroupBy(r => r.ProjectName);

            foreach (var group in reservationByProject)
            {
                foreach (var reservation in group)
                {
                    foreach (Parking parking in parkings)
                    {
                        if(parking.Availability == 1)
                        {
                            ParkingAssign parkingassign = new ParkingAssign();

                            string datename1 = reservation.Date;
                            DateTime date = DateTime.ParseExact(datename1, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                            string dayName = date.ToString("dddd");

                            parkingassign.DayName = dayName;
                            parkingassign.Date = datename1;
                            parkingassign.SlotName = parking.SlotName;
                            parkingassign.Location = parking.Location;
                            parkingassign.TimeIn = reservation.ArrivalTime;
                            parkingassign.TimeOut = reservation.DepartureTime;
                            parkingassign.Status = "Reserved";

                            parkingassigns.Add(parkingassign);

                            string queryString = "UPDATE parking_slots SET is_available = 0 WHERE slot_name = @SlotName";
                            using (SqlConnection connection1 = new SqlConnection(connectionString))
                            {
                                using(SqlCommand command = new SqlCommand(queryString, connection1))
                                {
                                    command.Parameters.AddWithValue("@SlotName", parking.SlotName);

                                    connection1.Open();

                                    int rowsAffected = command.ExecuteNonQuery();

                                    connection1.Close();
                                }
                            }
                        }
                    }
                }
            }

            foreach (ParkingAssign parkingassign in parkingassigns)
            {
                DateTime currentTime = DateTime.Now;
                DateTime timeOutDateTime = DateTime.Today + parkingassign.TimeOut;
                if (currentTime > timeOutDateTime)
                {
                    parkingassign.Status = "Expired";

                    string queryString = "UPDATE parking_slots SET is_available = 1 WHERE slot_name = @SlotName";
                    using (SqlConnection connection1 = new SqlConnection(connectionString))
                    {
                        using (SqlCommand command = new SqlCommand(queryString, connection1))
                        {
                            command.Parameters.AddWithValue("@SlotName", parkingassign.SlotName);

                            connection1.Open();

                            int rowsAffected = command.ExecuteNonQuery();

                            connection1.Close();
                        }

                    }
                }
            }
        }
    }
}