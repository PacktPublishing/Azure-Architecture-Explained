using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using SecurityInDepth.Data;
using SecurityInDepth.Models;

namespace SecurityInDepth.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private ItemsContext _context;

    public HomeController(ILogger<HomeController> logger, ItemsContext context)
    {
        _logger = logger;
        _context=context;

    }

    public IActionResult Index()
    {
        ViewBag.Message = "Click a button to get started!";
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    public async Task<IActionResult> SimpleConnection()
        {
            ViewBag.Message = "Got some data just using a connection string with a secret key.";

            try
            {

            var results = _context.Item.ToList();
            return View("Index", results);
            }
            catch (Exception ex)
            {
                ViewBag.Message = ex.Message;
            }
            return View("Index");
        }

        public async Task<IActionResult> CreateDatabase()
        {
            try
            {
                _context.CreateDatabase();
               ViewBag.Message = "Database created successfully";
            }
            catch (Exception ex)
            {
                ViewBag.Message = ex.Message;
            }
            return View("Index");
        }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
