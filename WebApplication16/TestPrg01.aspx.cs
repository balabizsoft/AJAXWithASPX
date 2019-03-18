using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.Script.Services;

namespace WebApplication16
{
    public partial class TestPrg01 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if(IsPostBack)
            {

                //ParameterCollection param = new ParameterCollection();
                //string[] paramName = this.hidParam.Value.Split('$');
                //for(int i=0;i<paramName.Length;i++)
                //{
                //    string[] paramval = paramName[i].Split(':');
                //    for(int j=0;j<paramval.Length;j++)
                //    {
                        
                //    }
                //}
                
            }
        }

        [WebMethod]  
        public static string GetData()  
        {  
            return "This string is from Code behind";  
        }  

        [WebMethod]        
        public static string Save(List<mydata> datas)
        {

            try
            {
                var str = "";
                foreach(var  idata in datas)
                {
                    str += $"{idata.name} : {idata.value}\n";
                }

                return str;
            }
            catch(Exception ex)
            {
                return "Not Saved";
            }
            
        }

        public class mydata
        {
            public string name { get; set; }
            public string value { get; set; }
        }
    }
}