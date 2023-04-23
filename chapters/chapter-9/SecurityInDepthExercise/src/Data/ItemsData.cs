using Microsoft.EntityFrameworkCore;

namespace SecurityInDepth.Data
{
    public class ItemsContext : DbContext
    {
        public ItemsContext(DbContextOptions<ItemsContext> options)
            : base(options)
        {

        }

        public void CreateDatabase()
        {
            try{
            Database.Migrate();
            if (Item.Count() == 0)
            {
                Item.Add(new SecurityInDepth.Models.Item { Name = "Sample Item", Description = "Sample Item" });
                SaveChanges();
            }
            }
            catch(Exception ex){
                throw new Exception(ex.Message);
            }
        }

        public DbSet<SecurityInDepth.Models.Item> Item { get; set; }
    }
}