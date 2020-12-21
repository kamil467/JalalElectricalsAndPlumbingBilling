using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;

namespace NemisisWebApp.Service
{

    public class ProductService {

        private readonly NemisisBillingEntities context;

        public ProductService()
        {
            this.context = new NemisisBillingEntities();
        }

        public Task<List<Product>> GetProductsBySearhString(string searchString)
        {
            var taskResult = Task.Factory.StartNew(() =>
            {
                var list = this.context
                    .Products
                    .Where(p => p.Name.Trim().ToLower().Contains(searchString.Trim().ToLower()) || p.Description.Trim().ToLower().Contains(searchString.Trim().ToLower()))
                     .ToList();

                return list;
            });

            Task.WaitAll();
            return taskResult;
        }

        public Task<Product> GetProductById(int Id)
        {
            var taskResult = Task.Factory.StartNew(() => {

                var product = this.context.Products.Where(p => p.Id == Id).FirstOrDefault();
                return product;
            });

            Task.WaitAll();

            return taskResult;
        }

        public Task<List<Product>> GetAllProducts()
        {
            var taskResult = Task.Factory.StartNew(() =>
            {
                var list = this.context
                    .Products.ToList();
                   
                return list;
            });

            Task.WaitAll();
            return taskResult;
        }
    }

}