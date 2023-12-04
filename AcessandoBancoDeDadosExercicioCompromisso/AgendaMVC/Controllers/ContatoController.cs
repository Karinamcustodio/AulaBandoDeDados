using AgendaMVC.Dao;
using AgendaMVC.Models;
using AgendaMVC.Dados;
using Microsoft.AspNetCore.Mvc;

namespace AgendaMVC.Controllers
{
    public class ContatoController : Controller
    {
        
        public IActionResult Index()
        {
            return View( new DaoContato().details());
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Contato contato)
        {
            //contato.Id = DataBase.contatos.Count + 1;
            //DataBase.contatos.Add(contato);
            new DaoContato().create(contato);
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Edit(int? id)
        {
            Contato contato = new DaoContato().details((int) id);
            return View(contato);
        }

        [HttpPost]
        public IActionResult Edit(Contato contato)
        {
            Contato cont = new DaoContato().details(contato.Id);
            cont.Nome = contato.Nome;
            cont.Email = contato.Email;
            cont.Telefone = contato.Telefone;
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Details(int? id)
        {
            // Contato contato = DataBase.contatos.FirstOrDefault(cont => cont.Id == id);
            Contato contato = new DaoContato().details((int)id);
            return View(contato);
        }

        [HttpPost]
        public IActionResult Delete(int? id)
        {
            new DaoContato().delete((int)id);
            return RedirectToAction("Index");
        }
    }
}
