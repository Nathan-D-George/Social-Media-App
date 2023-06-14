import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect(){ 
  }
  preview(){
    this.clearPreviews();
    for (let i = 0; i < this.targets.element.files.length; i++){
      let file = this.targets.element.files[i];
      const reader = new FileReader();
      this.createAndDisplayFilePreviewElements(file, reader);
    }
  }
  createAndDisplayFilePreviewElements(file, reader){
    reader.onload = () => {
      let element = this.constructPreviews(file, reader);
      element.src = reader.result;
      element.setAttribute("href", reader.result);
      element.setAttribute("target", "_blank");
      element.classList.add("photo-preview");

      document.getElementById("photo-preview").appendChild(element);
    };
    reader.readAsDataURL(file);
  }

  constructPreviews(file, reader){
    let element;
    //let cancelFunction = (e) => this.remove
    switch(file.type){
      case "image/avif":
      case "image/jpeg":
      case "image/jpg" :
      case "image/png" :
        element = this.createImageElement(reader);
        break;
    }
    element.dataset.filename = file.name;
    return element;
  }
  createImageElement(reader){
    let element;
    const image = document.createElement("img");
    image.setAttribute("style","background-image: url(" + reader.result + ")");
    image.classList.add("photo-preview");
    element = document.createElement("div");
    element.appendChild(image);
    return element;
  }

  clearPreviews(){
    document.getElementByID("photo-preview").innerHTML = "";
  }
}