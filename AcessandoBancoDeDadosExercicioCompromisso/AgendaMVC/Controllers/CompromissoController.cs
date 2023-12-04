using AgendaMVC.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace AgendaMVC.Controllers
{
    public class CompromissoController : Controller
    {
        public IActionResult Index()
        {
            return View(Dados.DataBase.compromissos);
        }

        [HttpGet]
        public IActionResult Create()
        {
            List<SelectListItem> Contatos = new List<SelectListItem>();
            Contatos = Dados.DataBase.contatos.Select(cont => new SelectListItem()
            { Text = cont.Email, Value = cont.Id.ToString() }).ToList();
            ViewBag.Contatos = Contatos;

            List<SelectListItem> Locais = new List<SelectListItem>();
            Locais = Dados.DataBase.locais.Select(loc => new SelectListItem()
            { Text = loc.NomeLocal, Value = loc.Id.ToString() }).ToList();
            ViewBag.Locais = Locais;
            return View();
        }

        [HttpPost]
        public IActionResult Create(Compromisso compromisso)
        {
            compromisso.Id = Dados.DataBase.compromissos.Max(cont => cont.Id) + 1;
            compromisso.Contato = Dados.DataBase.contatos.FirstOrDefault(cont => cont.Id == compromisso.Contato.Id);
            compromisso.Local = Dados.DataBase.locais.FirstOrDefault(loc => loc.Id == compromisso.Local.Id);
            Dados.DataBase.compromissos.Add(compromisso);
            return RedirectToAction("Index");
        }
    }
}
