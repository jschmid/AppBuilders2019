package ch.liip.appbuilders2019.api

import retrofit2.create

sealed class ApiResponse
data class Success(val todos: List<Todo>) : ApiResponse()
data class Failure(val error: String) : ApiResponse()

object ApiClient {

    private val service = retrofit.create<ApiService>()

    suspend fun getTodos(): ApiResponse {
        val response = service.getTodosAsync().await()

        val result = response.body() ?: return Failure("Could not fetch todos")

        return Success(result)
    }
}