using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(COPInspectionChecklistProject.Startup))]
namespace COPInspectionChecklistProject
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
