package ch.liip.appbuilders2019.api

import com.jakewharton.retrofit2.adapter.kotlin.coroutines.CoroutineCallAdapterFactory
import com.jakewharton.retrofit2.converter.kotlinx.serialization.asConverterFactory
import kotlinx.coroutines.Deferred
import kotlinx.serialization.json.Json
import okhttp3.MediaType
import retrofit2.Call
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.http.GET

interface ApiService {

    @GET("todos")
    fun getTodos(): Call<List<Todo>>

    @GET("todos")
    fun getTodosAsync(): Deferred<Response<List<Todo>>>

}

private val contentType = MediaType.get("application/json")
val retrofit: Retrofit = Retrofit.Builder()
    .baseUrl("http://10.0.2.2:3000/")
    .addConverterFactory(Json.asConverterFactory(contentType))
    .addCallAdapterFactory(CoroutineCallAdapterFactory())
    .build()
