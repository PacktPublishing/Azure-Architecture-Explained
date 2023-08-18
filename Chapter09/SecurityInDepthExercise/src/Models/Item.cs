namespace SecurityInDepth.Models
{
    public class Item {
        public string Id {get;set;}

        public string? Name {get;set;}

        public string? Description {get;set;}

        public bool Completed {get;set;}

        public Item(){
            Id = Guid.NewGuid().ToString();
            Completed=false;
        }
    }
}