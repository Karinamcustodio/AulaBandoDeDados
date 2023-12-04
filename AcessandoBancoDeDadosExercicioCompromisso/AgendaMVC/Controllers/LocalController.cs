using AgendaMVC.Dao;
using AgendaMVC.Models;
using AgendaMVC.Dados;
using Microsoft.AspNetCore.Mvc;

namespace AgendaMVC.Controllers
{
    public class LocalController : Controller
    {
         
        public IActionResult Index()
        {
            return View( new DaoLocal().details());
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Local locais)
        {
            //locais.Id = DataBase.locais.Count + 1;
            //DataBase.locais.Add(locais);
            new DaoLocal().create(locais);
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Edit(int? id)
        {
            //Local locais = DataBase.locais.FirstOrDefault(cont => cont.Id == id);
            Local locais = new DaoLocal().details((int)id);
            return View(locais);
        }

        [HttpPost]
        public IActionResult Edit(Local locais)
        {
            //Local loc = DataBase.locais.FirstOrDefault(lc => lc.Id == locais.Id);
            Local loc = new DaoLocal().details(locais.Id);
            loc.NomeLocal = locais.NomeLocal;
            loc.Rua = locais.Rua;
            loc.Numero = locais.Numero;
            loc.Bairro = locais.Bairro;
            loc.Cidade = locais.Cidade;
            loc.Uf = locais.Uf;
            loc.Cep = locais.Cep;
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Details(int? id)
        {
            //Local locais = DataBase.locais.FirstOrDefault(loc => loc.Id == id);
            Local locais = new DaoLocal().details((int)id);
            return View(locais);
        }
    }
}
