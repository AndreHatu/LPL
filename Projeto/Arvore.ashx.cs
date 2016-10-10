using System;
using System.Collections.Generic;
using System.Web;

namespace Projeto
{
	/// <summary>
	/// Summary description for Cover
	/// </summary>
	public class Arvore : IHttpHandler
	{

		public void ProcessRequest(HttpContext context)
		{
			context.Response.ContentType = "image/png";
			try
			{

				int id;
				if (int.TryParse(context.Request.QueryString["id"], out id) == true)
				{
					string path = context.Server.MapPath("~/images/arvores/" + id + ".png");
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