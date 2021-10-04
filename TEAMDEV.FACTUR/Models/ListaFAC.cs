using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TEAMDEV.FACTUR.ENTITY.Response;
namespace TEAMDEV.FACTUR.Models
{
    public class ListaFAC
    {

        public List<ResponsePais>ListPais { get; set; }
        public List<ResponseMoneda> ListMoneda { get; set; }
        public List <ResponseTImpuesto> ListTImpuesto { get; set; }
        public List<ResponsePorcentaje> ListPorcentaje { get; set; }
    }
}