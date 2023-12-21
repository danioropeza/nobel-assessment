namespace ConsoleAppUniqueTopics.Models
{
    public class CodingResources
    {
        public int Id { get; set; }
        public string? Description { get; set; }
        public string? Url { get; set; }
        public string[]? Types { get; set; }
        public string[]? Topics { get; set; }
        public string[]? Levels { get; set; }
    }
}
