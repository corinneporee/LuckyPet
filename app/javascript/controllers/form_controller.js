import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["weightRange"]

  connect() {
    // On crée un élément custom pour pouvoir ajouter la value de l'input
    let sliderInput = document.createElement('div')
    // On lui ajoute une classe pour le styliser et interagir dessus ensuite
    sliderInput.classList.add('slider-value')
    // On lui ajoute en texte la valeur par défaut du champ d'input (50)
    sliderInput.innerText = this.weightRangeTarget.value;
    // On vient le positionner en lien avec le placement du petit rond de l'input
    sliderInput.style.left = `calc(${this.weightRangeTarget.value}% - 16px)`
    // On ajoute cet élément au DOM
    document.querySelector('.range').appendChild(sliderInput);
  }

  updateValue() {
    // On vient récupérer notre div custom
    let sliderInput = document.querySelector('.slider-value');
    // On lui donne la nouvelle valeur de l'input
    sliderInput.innerText = this.weightRangeTarget.value;
    // On vient le placer en fonction de cette valeur - la moitiée de sa taille pour qu'il soit centré
    sliderInput.style.left = `calc(${this.weightRangeTarget.value}% - 16px)`
  }
}
