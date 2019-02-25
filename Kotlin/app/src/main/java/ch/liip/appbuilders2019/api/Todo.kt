package ch.liip.appbuilders2019.api

import kotlinx.serialization.Serializable

@Serializable
data class Todo(
    var id: Int,
    var title: String,
    var completed: Boolean
)

fun Todo.summary(): String {
    val doneValue = if (completed) "✅" else "❌"
    return "$doneValue $title"
}

