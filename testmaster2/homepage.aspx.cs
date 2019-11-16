using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testmaster2
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Page_PreInit(object sender, EventArgs e)
        {           
            if (Request.Browser.IsMobileDevice)
                MasterPageFile = "~/Mobile.master";
            else
                MasterPageFile = "~/Site.master";
        }
    }
}