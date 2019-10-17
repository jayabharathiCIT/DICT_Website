//*******************************************************************
// Programmer :Jayabharathi
// Date: 20-09-2019
// Purpose: Show header , footer and menu bar for all the pages in the DICT websit
// Software:   Microsoft Visual Studio 2019 Community Edition
// Platform:   Microsoft Windows 
//******************************************************************* 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace testmaster2
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // MenuItemCollection menuItems = DICTMenuBar2.Items;
            MenuItem addPostItem = new MenuItem();
            MenuItem ViewPostItem = new MenuItem();
            MenuItem registerItem = new MenuItem();
            MenuItem loginItem = new MenuItem();
            MenuItem forumMenu = DICTMenuBar2.Items[2];
            //find menus and show and hide based on the user login .
            foreach (MenuItem menuItem in forumMenu.ChildItems)
            {
                if (menuItem.Text == "Add Post")
                {
                    addPostItem = menuItem;
                }
                if (menuItem.Text == "View All Post")
                {
                    ViewPostItem = menuItem;
                }
                if(menuItem.Text == "Register")
                {
                    registerItem = menuItem;
                }
                if(menuItem.Text == "Login")
                {
                    loginItem = menuItem;
                }

            }

            //Not logged in
            if (Session["RegID"] == null)
            {

                forumMenu.ChildItems.Remove(addPostItem);
                forumMenu.ChildItems.Remove(ViewPostItem);
            }
            else // login sucess
            {
                forumMenu.ChildItems.Remove(registerItem);
                forumMenu.ChildItems.Remove(loginItem);
            }
        }
    }
}