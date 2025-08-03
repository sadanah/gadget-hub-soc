using System.ServiceModel;

namespace GadgetHub.Service
{
    // This interface defines the contract for the GadgetHub service, which includes methods for user registration.
    // The methods are decorated with OperationContract to indicate that they can be called by clients.
    [ServiceContract]
    public interface IGadgetHubService
    {
        [OperationContract]
        bool RegisterUser(string firstName, string lastName, string phoneNumber, string username, string password, string email, string role);
    }
}

