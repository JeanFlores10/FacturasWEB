using Newtonsoft.Json;
using System;
using TEAMDEV.FACTUR.CLIENT;
using TEAMDEV.FACTUR.ENTITY.Parametros;
using TEAMDEV.FACTUR.ENTITY.Response;

namespace TEAMDEV.FACTUR.BUSINESS
{
    public class BURegistroEmpresa
    {
        readonly ClientCL client;

        public BURegistroEmpresa()
        {
            client = new ClientCL();
        }
        public ResponseRegistroEmpresa validarRegistro(RegistroEmpresaEN paramss, string token)
        {
            try
            {
                return JsonConvert.DeserializeObject<ResponseRegistroEmpresa>(client.Post<RegistroEmpresaEN>("RegistroEmpresa/validarRegistro", paramss, token));
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public ResponseRegistroEmpresa insertarEmpresa(RegistroEmpresaEN paramss, string token)
        {
            try
            {
                return JsonConvert.DeserializeObject<ResponseRegistroEmpresa>(client.Post<RegistroEmpresaEN>("RegistroEmpresa/insertarEmpresa", paramss, token));
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public ResponseRegistroEmpresa insertarUserAdminEmpresa(RegistroEmpresaEN paramss, string token)
        {
            try
            {
                return JsonConvert.DeserializeObject<ResponseRegistroEmpresa>(client.Post<RegistroEmpresaEN>("RegistroEmpresa/insertarUserAdminEmpresa", paramss, token));
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
