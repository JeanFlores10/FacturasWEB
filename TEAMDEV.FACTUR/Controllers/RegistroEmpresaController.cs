using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TEAMDEV.FACTUR.BUSINESS;
using TEAMDEV.FACTUR.ENTITY.Encrypt;
using TEAMDEV.FACTUR.ENTITY.Parametros;
using TEAMDEV.FACTUR.Models;

namespace TEAMDEV.FACTUR.Controllers
{
    public class RegistroEmpresaController : Controller
    {
        readonly ListaFAC model;
        readonly BUPais bupais;
        readonly BURegistroEmpresa buregistroempresa;


        public RegistroEmpresaController()
        {
            model = new ListaFAC();
            bupais = new BUPais();
            buregistroempresa = new BURegistroEmpresa();
        }
        // GET: RegistroEmpresa
        public ActionResult RegistroEmpresa(RegistroEmpresaEN paramss)
        {
            string token = "";

            model.ListPais = bupais.listarPaises(paramss,token);
            model.ListMoneda = bupais.listarMoneda(paramss, token);
            model.ListTImpuesto = bupais.listarTImpuesto(paramss, token);
            model.ListPorcentaje = bupais.listarPorcentaje(paramss, token);
            return View(model);
        }



        [AllowAnonymous]
        [HttpPost]
        public ActionResult validarRegistro(RegistroEmpresaEN paramss)
        {
            string token = "";
            var rpta = buregistroempresa.validarRegistro(paramss, token);
            return Json(new { dt = rpta });


        }

        [HttpPost]
        public ActionResult insertarEmpresa(HttpPostedFileBase file, string razonsocial,
            string ruc, string email, int idpais, int idmoneda, string direccion, int idimpuesto, int idporcentaje, 
            int vendeimpuesto, string username, string usuario, string password)
        {
            try
            {
                var clave = Encrypt.GetSHA256(password);
                var filename = "";
                if (file != null)
                {
                    string path = Server.MapPath("~/Content/images/images_empresa/" + ruc + "/");
                    string filePath = string.Empty;
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }
                    filePath = path + Path.GetFileName(file.FileName);
                    file.SaveAs(filePath);
                    filename = file.FileName;

                }
                var rpta = "ok";
                return Json(new { dt = rpta });
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


    }
}
