using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TEAMDEV.FACTUR.ENTITY.Parametros
{
    public class RegistroEmpresaEN
    {
        public string razonsocial { get; set; }
        public string ruc { get; set; }
        public string email { get; set; }

        public int idpais { get; set; }
        public int idmoneda { get; set; }
        public int VendeconImpuestos { get; set; }
        public int TImpuestos { get; set; }
        public int idPorcentaje { get; set; }
        public string direccion { get; set; }
        public string imagen { get; set; }
        public int status { get; set; }
        public DateTime fecharegistro { get; set; }

        public string username { get; set; }
        public string usuario { get; set; }
        public string password { get; set; }
        public int cantuser { get; set; }
        public string cargo { get; set; }
        public string filename { get; set; }
        public string proyecto { get; set; }
    }
}
