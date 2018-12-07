using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using System.IO;

namespace Common
{
    public class UpLoadImages
    {
        /**/
        /// <summary>
        /// 生成缩略图
        /// </summary>
        /// <param name="originalImagePath">源图路径（物理路径）</param>
        /// <param name="thumbnailPath">缩略图路径（物理路径）</param>
        /// <param name="width">缩略图宽度</param>
        /// <param name="height">缩略图高度</param>
        /// <param name="mode">生成缩略图的方式</param>    
        public static void MakeThumbnail(string originalImagePath, string thumbnailPath, int width, int height, string mode)
        {
            System.Drawing.Image originalImage = System.Drawing.Image.FromFile(originalImagePath);

            int towidth = width;
            int toheight = height;

            int x = 0;
            int y = 0;
            int ow = originalImage.Width;
            int oh = originalImage.Height;

            switch (mode)
            {
                case "HW"://指定高宽缩放（可能变形）                
                    break;
                case "W"://指定宽，高按比例                    
                    toheight = originalImage.Height * width / originalImage.Width;
                    break;
                case "H"://指定高，宽按比例
                    towidth = originalImage.Width * height / originalImage.Height;
                    break;
                case "Cut"://指定高宽裁减（不变形）                
                    if ((double)originalImage.Width / (double)originalImage.Height > (double)towidth / (double)toheight)
                    {
                        oh = originalImage.Height;
                        ow = originalImage.Height * towidth / toheight;
                        y = 0;
                        x = (originalImage.Width - ow) / 2;
                    }
                    else
                    {
                        ow = originalImage.Width;
                        oh = originalImage.Width * height / towidth;
                        x = 0;
                        y = (originalImage.Height - oh) / 2;
                    }
                    break;
                default:
                    break;
            }

            //新建一个bmp图片
            System.Drawing.Image bitmap = new System.Drawing.Bitmap(towidth, toheight);

            //新建一个画板
            System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bitmap);

            //设置高质量插值法
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;

            //设置高质量,低速度呈现平滑程度
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;

            //清空画布并以透明背景色填充
            g.Clear(System.Drawing.Color.Transparent);

            //在指定位置并且按指定大小绘制原图片的指定部分
            g.DrawImage(originalImage, new System.Drawing.Rectangle(0, 0, towidth, toheight),
                new System.Drawing.Rectangle(x, y, ow, oh),
                System.Drawing.GraphicsUnit.Pixel);

            try
            {
                //以jpg格式保存缩略图
                bitmap.Save(thumbnailPath, System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            catch (System.Exception e)
            {
                throw e;
            }
            finally
            {
                originalImage.Dispose();
                bitmap.Dispose();
                g.Dispose();
            }
        }

        /**/
        /// <summary>
        /// 在图片上增加文字水印
        /// </summary>
        /// <param name="Path">原服务器图片路径</param>
        /// <param name="Path_sy">生成的带文字水印的图片路径</param>
        public static void AddShuiYinWord(string Path, string Path_sy)
        {
            string addText = "CopyRight(R):Http://www.situational.com.cn";
            System.Drawing.Image image = System.Drawing.Image.FromFile(Path);
            System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(image);
            g.DrawImage(image, 0, 0, image.Width, image.Height);
            System.Drawing.Font f = new System.Drawing.Font("Verdana", 16);
            System.Drawing.Brush b = new System.Drawing.SolidBrush(System.Drawing.Color.Blue);

            g.DrawString(addText, f, b, 15, 15);
            g.Dispose();

            image.Save(Path_sy);
            image.Dispose();
        }

        /**/
        /// <summary>
        /// 在图片上生成图片水印
        /// </summary>
        /// <param name="Path">原服务器图片路径</param>
        /// <param name="Path_syp">生成的带图片水印的图片路径</param>
        /// <param name="Path_sypf">水印图片路径</param>
        public static void AddShuiYinPic(string Path, string Path_syp, string Path_sypf)
        {
            System.Drawing.Image image = System.Drawing.Image.FromFile(Path);
            System.Drawing.Image copyImage = System.Drawing.Image.FromFile(Path_sypf);
            System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(image);
            g.DrawImage(copyImage, new System.Drawing.Rectangle(image.Width - copyImage.Width, image.Height - copyImage.Height, copyImage.Width, copyImage.Height), 0, 0, copyImage.Width, copyImage.Height, System.Drawing.GraphicsUnit.Pixel);
            g.Dispose();

            image.Save(Path_syp);
            image.Dispose();
        }

        /// <summary>
        /// 上传图片
        /// </summary>
        /// <param name="fileupload">上传控件</param>
        /// <param name="Size">限制大小</param>
        /// <param name="Path">服务器路径</param>
        /// <param name="img_w">以宽裁剪时的宽度</param>
        /// <param name="img_h">以高裁剪时的高度</param>
        /// <param name="lb_Msg">文本控件</param>
        public static void upImage(FileUpload fileupload, int Size, string Path, int img_w, int img_h, Label lb_Msg)
        {
            string PicContentType = fileupload.PostedFile.ContentType;

            if (PicContentType == "image/pjpeg" || PicContentType == "image/gif" || PicContentType == "image/bmp")
            {
                if (fileupload.PostedFile.ContentLength > Size)
                {
                    lb_Msg.Text = "图片超过限制大小！";
                }
                else
                {
                    FileInfo file = new FileInfo(fileupload.PostedFile.FileName);
                    string webFilesName = DateTime.Now.ToString("yyyyMMddHHmmssffffff") + "." + file.Name.Substring(file.Name.LastIndexOf(".") + 1);// +file.Name;
                    string webFiles_sName = "s_" + DateTime.Now.ToString("yyyyMMddHHmmssffffff") + "." + file.Name.Substring(file.Name.LastIndexOf(".") + 1);// +file.Name;
                    //服务器上原图
                    string webFiles = Path + webFilesName;
                    //服务器上缩略图
                    string webFiles_s = Path + webFiles_sName;

                    fileupload.SaveAs(webFiles);

                    System.Drawing.Image originalImage = System.Drawing.Image.FromFile(webFiles);
                    int ow = originalImage.Width;
                    int oh = originalImage.Height;
                    if (ow > img_w || oh > img_h)
                    {
                        if (ow >= oh)
                        {
                            //按width缩小
                            Common.UpLoadImages.MakeThumbnail(webFiles, webFiles_s, img_w, img_h, "W");     // 生成缩略图方法
                            SmallPic = webFiles_sName;
                            BigPic = webFilesName;
                        }
                        else
                        {

                            //按height缩小
                            Common.UpLoadImages.MakeThumbnail(webFiles, webFiles_s, img_w, img_h, "H");     // 生成缩略图方法

                            SmallPic = webFiles_sName;
                            BigPic = webFilesName;
                        }
                    }
                    else
                    {
                        SmallPic = webFilesName;
                        BigPic = webFilesName;
                    }

                    lb_Msg.Text = "图片上传成功！";
                }
            }
            else
            {
                lb_Msg.Text="图片格试不对！";
            }
        }
        /// <summary>
        /// 小图地址
        /// </summary>
        public static string SmallPic;
        /// <summary>
        /// 大图地址
        /// </summary>
        public static string BigPic;
    }
}
