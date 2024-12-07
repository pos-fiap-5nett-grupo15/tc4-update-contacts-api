using CreateContract.Worker;
using Microsoft.AspNetCore.Builder;

internal class Program
{
    private static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        var startup = new Startup(builder.Configuration);
        startup.ConfigureService(builder.Services);

        var app = builder.Build();
        startup.Configure(app, app.Environment);
        app.Run();
    }
}