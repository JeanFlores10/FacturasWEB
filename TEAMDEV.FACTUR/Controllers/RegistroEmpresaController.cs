using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TEAMDEV.FACTUR.BUSINESS;
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



    }
}
