using System;
using System.Collections.Generic;
using System.Drawing;
using System.Text;
using System.Web;

namespace Projeto.Utils
{
	public static class AvatarSaver
	{
		public static void SaveImage(int id, HttpPostedFile file)
		{
			using (Bitmap bitmap = (Bitmap)Image.FromStream(file.InputStream))
			{
				int max = Math.Max(bitmap.Width, bitmap.Height);
				if (max > 1000 || bitmap.Width != bitmap.Height)
				{
					if (max > 1000)
					{
						max = 1000;
					}

					using (Bitmap square = new Bitmap(max, max, System.Drawing.Imaging.PixelFormat.Format24bppRgb))
					{
						using (Graphics graphics = Graphics.FromImage(square))
						{
							graphics.FillRectangle(Brushes.White, 0, 0, max, max);

							int w, h;

							if (bitmap.Width >= bitmap.Height)
							{
								w = max;
								h = (bitmap.Height * max) / bitmap.Width;
							}
							else
							{
								h = max;
								w = (bitmap.Width * max) / bitmap.Height;
							}

							graphics.DrawImage(bitmap, new Rectangle((max - w) / 2, (max - h) / 2, w, h), new Rectangle(0, 0, bitmap.Width, bitmap.Height), GraphicsUnit.Pixel);

						}
						square.Save(HttpContext.Current.Server.MapPath("~/User_Images/" + id + ".jpg"), System.Drawing.Imaging.ImageFormat.Jpeg);
					}
				}
				else
				{
					bitmap.Save(HttpContext.Current.Server.MapPath("~/User_Images/" + id + ".jpg"), System.Drawing.Imaging.ImageFormat.Jpeg);
				}
			}
		}
	}
}
