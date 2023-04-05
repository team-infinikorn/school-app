import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.coursesSelect2()
  }

  coursesSelect2() {
    $('#select-course-type').select2({ placeholder: 'Select Courses' })
  }
}
