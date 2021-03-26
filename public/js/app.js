var openmodal = document.querySelectorAll('.modal-open')

for (var i = 0; i < openmodal.length; i++) {
    openmodal[i].addEventListener('click', function (event) {
        event.preventDefault()

        toggleModal(event.target.id)
    })
}


const overlay = document.querySelector('.modal-overlay')
overlay.addEventListener('click', toggleModal)


var closemodal = document.querySelectorAll('.modal-close')
for (var i = 0; i < closemodal.length; i++) {
    closemodal[i].addEventListener('click', function (event){
        event.preventDefault()
        toggleModal(event.target.id)
    })
}


function toggleModal(id) {
    const body = document.querySelector('body')
    const modal = document.querySelector('.modal-'+id)
    modal.classList.toggle('opacity-0')
    modal.classList.toggle('pointer-events-none')
    body.classList.toggle('modal-active')
}