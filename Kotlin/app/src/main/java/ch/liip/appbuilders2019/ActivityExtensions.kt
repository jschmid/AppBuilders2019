package ch.liip.appbuilders2019

import ch.liip.appbuilders2019.api.ApiClient
import ch.liip.appbuilders2019.api.Failure
import ch.liip.appbuilders2019.api.Success

suspend fun MainActivity.loadTodos() {
    val response = ApiClient.getTodos()
    when (response) {
        is Success -> this.setTodos(response.todos)
        is Failure -> println("Error: ${response.error}")
    }
}
