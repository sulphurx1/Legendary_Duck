using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;

namespace Smart_Parkiing
{
    public class Reservation
    {
        public string EID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ProjectName { get; set; }
        public TimeSpan DepartureTime { get; set; }
    }

    public class Parking
    {
        public string ParkingID { get; set; }
        public string ParkingSlotID { get; set; }
        public int ParkingAvailability { get; set; }
    }

    class Program
    {
        static void Main(string[] args)
        {
            List<Reservation> reservations = new List<Reservation>();
            List<Parking> parkings = new List<Parking>();

            string connectionString = "Data Source=DESKTOP-5N7T2MK\\SQLEXPRESS;Initial Catalog=tazskin_retard;Integrated Security=True";
            SqlConnection connection = new SqlConnection (connectionString);

            connection.Open ();
            DateTime tomorrow = DateTime.Today.AddDays(1);
            string queryString1 = "SELECT e_id, first_name, last_name, project_name, departure_time FROM reservation_with_project WHERE date = @date";
            string queryString2 = "SELECT location, slot_name, is_available FROM parking_slots";
            SqlCommand command1 = new SqlCommand(queryString1, connection);
            SqlCommand command2 = new SqlCommand (queryString2, connection);
            command1.Parameters.AddWithValue("@date", tomorrow);

            using SqlDataReader reader1 = command1.ExecuteReader();
            while (reader1.Read())
            {
                Reservation reservation = new Reservation()
                {
                    EID = reader1.GetString(0),
                    FirstName = reader1.GetString(1),
                    LastName = reader1.GetString(2),
                    ProjectName = reader1.GetString(3),
                    DepartureTime = reader1.GetTimeSpan(4)
                };
                reservations.Add(reservation);
            }

            using SqlDataReader reader2 = command2.ExecuteReader();
            while (reader2.Read())
            {
                Parking parking = new Parking()
                {
                    ParkingID = reader2.GetString(0),
                    ParkingSlotID = reader2.GetString(1),
                    ParkingAvailability = reader2.GetInt32(2)
                };
                parkings.Add(parking);
            }
            var groups = reservations.GroupBy(r => r.ProjectName);

            foreach (var group in groups)
            {
                Console.WriteLine($"Project Name: {group.Key}");
                foreach (var reservation in group.OrderBy(r => r.DepartureTime))
                {
                    foreach (var parking in parkings)
                    {
                        if (parking.ParkingSlotID == "Next Tower")
                        {
                            
                        }
                    }
                }
            }
            
            connection.Close();
        }
    }
}