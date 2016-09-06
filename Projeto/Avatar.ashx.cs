using System;
using System.Collections.Generic;
using System.Web;

namespace Projeto
{
	/// <summary>
	/// Summary description for Cover
	/// </summary>
	public class Avatar : IHttpHandler
	{

		public void ProcessRequest(HttpContext context)
		{
			context.Response.ContentType = "image/jpeg";
			try
			{

				int id;
				if (int.TryParse(context.Request.QueryString["id"], out id) == true)
				{
					string path = context.Server.MapPath("~/User_Images/" + id + ".jpg");
					if (System.IO.File.Exists(path))
					{
						context.Response.WriteFile(path);
						return;
					}
				}
			}
			catch
			{
			}

			context.Response.WriteFile(context.Server.MapPath("~/NoAvatar.jpg"));
		}

		public bool IsReusable
		{
			get
			{
				return true;
			}
		}
	}
}