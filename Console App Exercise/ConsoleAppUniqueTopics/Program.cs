using System.Text.Json;
using System.Net.Http.Headers;
using ConsoleAppUniqueTopics.Models;

namespace ConsoleAppUniqueTopics
{
    class Program
    {
        static async Task Main(string[] args)
        {
            HttpClient httpClient = GetHttpClient();
            CodingResources[] codingResources = await RetrieveCodingResources(httpClient);
            HashSet<string> uniqueTopics = GetUniqueTopics(codingResources);
            PrintUniqueTopics(uniqueTopics);
        }

        static HttpClient GetHttpClient()
        {
            HttpClient httpClient = new HttpClient();
            httpClient.BaseAddress = new Uri("https://api.sampleapis.com/");
            httpClient.DefaultRequestHeaders.Accept.Clear();
            httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            return httpClient;
        }

        static async Task<CodingResources[]> RetrieveCodingResources(HttpClient httpClient)
        {
            CodingResources[] codingResources = { };
            try
            {
                using (httpClient)
                {
                    HttpResponseMessage response = await httpClient.GetAsync("codingresources/codingResources");
                    if (response.IsSuccessStatusCode)
                    {
                        string responseJsonString = await response.Content.ReadAsStringAsync();
                        var serializerOptions = new JsonSerializerOptions
                        {
                            PropertyNameCaseInsensitive = true
                        };

                        codingResources = JsonSerializer.Deserialize<CodingResources[]>(responseJsonString, serializerOptions)!;
                    }
                    else
                    {
                        Console.Error.WriteLine("ERROR: There was an error while trying to retrieve Coding Resources.");
                    }
                }
            }
            catch (Exception exception)
            {
                Console.Error.WriteLine("ERROR: There was an error while calling the method RetrieveCodingResources.");
                Console.Error.WriteLine(exception.Message);
            }
            return codingResources;
        }

        static HashSet<string> GetUniqueTopics(CodingResources[] codingResources)
        {
            HashSet<string> uniqueTopics= new HashSet<string>();
            foreach (var resource in codingResources)
            {
                if (resource.Topics != null)
                {
                    foreach (string topic in resource.Topics)
                    {
                        uniqueTopics.Add(topic);
                    }
                }
            }
            return uniqueTopics;
        }

        static void PrintUniqueTopics(HashSet<string> uniqueTopics)
        {
            foreach (string topic in uniqueTopics)
            {
                Console.WriteLine(topic);
            }
        }
    }
}