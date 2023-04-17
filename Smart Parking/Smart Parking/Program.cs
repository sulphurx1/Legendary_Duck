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

    class Program
    {
        static void Main(string[] args)
        {
            List<Reservation> reservations = new List<Reservation>();

            string connectionString = "Data Source=DESKTOP-5N7T2MK\\SQLEXPRESS;Initial Catalog=tazskin_retard;Integrated Security=True";
            SqlConnection connection = new SqlConnection (connectionString);

            connection.Open ();
            DateTime tomorrow = DateTime.Today.AddDays(1);
            string queryString = "SELECT e_id, first_name, last_name, project_name, departure_time FROM reservation_with_project WHERE date = @date";
            SqlCommand command = new SqlCommand(queryString, connection);
            command.Parameters.AddWithValue("@date", tomorrow);

            using SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Reservation reservation = new Reservation()
                {
                    EID = reader.GetString(0),
                    FirstName = reader.GetString(1),
                    LastName = reader.GetString(2),
                    ProjectName = reader.GetString(3),
                    DepartureTime = reader.GetTimeSpan(4)
                };
                reservations.Add(reservation);
                Console.WriteLine(reservation.EID);
                Console.WriteLine(reservation.FirstName + " " + reservation.LastName);
                Console.WriteLine(reservation.ProjectName);
                Console.WriteLine(reservation.DepartureTime);
            }
            connection.Close();
        }
    }
}