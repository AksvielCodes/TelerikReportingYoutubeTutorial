﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace TelerikReportingYoutubeTutorial
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            Telerik.Reporting.Services.WebApi.ReportsControllerConfiguration.RegisterRoutes(System.Web.Http.GlobalConfiguration.Configuration);
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}
