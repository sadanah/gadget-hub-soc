using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GadgetHubConsoleHost.GHServiceRef; // Namespace from the added service

namespace GadgetHubConsoleHost
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                // Create instance of the service proxy
                var service = new GadgetHubService1();

                // Call a method from the service
                var result = service.Login("testuser@example.com", "test123");

                Console.WriteLine("Login result: " + result);
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
            }

            Console.WriteLine("\nPress Enter to exit...");
            Console.ReadLine();
        }
    }
}
