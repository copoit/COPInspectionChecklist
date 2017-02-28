using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(OITMain.Startup))]
namespace OITMain
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
