(function(){
  async function getCodingResources() {
    const response = await fetch("https://api.sampleapis.com/codingresources/codingResources");
    return response.json();
  }
    
  getCodingResources()
    .then((codingResources => {
      loadCodingResources(codingResources);
    }))
    .catch(error => {
      console.error("There was an error while trying to get coding resources");
      console.error(error);
    })

  function loadCodingResources(loadingResources) {
    const table = document.getElementById("table");
    loadingResources.forEach(resource => {
      const row = table.insertRow(1);
      const descriptionCol = row.insertCell(0);
      const typesCol = row.insertCell(1);
      const topicsCol = row.insertCell(2);

      descriptionCol.append(generateLink(resource.description, resource.url));
      typesCol.innerHTML = resource.types.join(", ");
      topicsCol.innerHTML = resource.topics.join(", ");
    });
  }
  
  function generateLink(description, url) {
    const link = document.createElement('a');
    link.className = "link";
    link.target = "_blank";
    link.rel = "noreferrer";
    link.href = url;
    link.innerHTML = description;
    return link;
  }
})();