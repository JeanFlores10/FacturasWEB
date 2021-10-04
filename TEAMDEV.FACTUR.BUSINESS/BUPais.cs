using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TEAMDEV.FACTUR.CLIENT;
using TEAMDEV.FACTUR.ENTITY.Parametros;
using TEAMDEV.FACTUR.ENTITY.Response;

namespace TEAMDEV.FACTUR.BUSINESS
{
    public class BUPais
    {
        readonly ClientCL client;

        public BUPais()
        {
            client = new ClientCL();
        }

        public List<ResponsePais> listarPaises(RegistroEmpresaEN paramss, string token)
        {
            try
            {
                return JsonConvert.DeserializeObject<List<ResponsePais>>(client.Post<RegistroEmpresaEN>("RegistroEmpresa/listarPaises", paramss, token));
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<ResponseMoneda> listarMoneda(RegistroEmpresaEN paramss, string token)
        {
            try
            {
                return JsonConvert.DeserializeObject<List<ResponseMoneda>>(client.Post<RegistroEmpresaEN>("RegistroEmpresa/listarMoneda", paramss, token));
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public List<ResponseTImpuesto> listarTImpuesto(RegistroEmpresaEN paramss, string token)
        {
            try
            {
                return JsonConvert.DeserializeObject<List<ResponseTImpuesto>>(client.Post<RegistroEmpresaEN>("RegistroEmpresa/listarTImpuesto", paramss, token));
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }



        public List<ResponsePorcentaje> listarPorcentaje(RegistroEmpresaEN paramss, string token)
        {
            try
            {
                return JsonConvert.DeserializeObject<List<ResponsePorcentaje>>(client.Post<RegistroEmpresaEN>("RegistroEmpresa/listarPorcentaje", paramss, token));
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
