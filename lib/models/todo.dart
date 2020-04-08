import 'package:flutter/foundation.dart';

class Todo {
	final int id;
	final String content;
	final bool completed;

	Todo({
		@required this.id,
		@required this.content,
		this.completed = false,
	});

	Todo copyWith({ int id, String content, bool completed }) {
		return Todo(
			id: id ?? this.id,
			content: content ?? this.content,
			completed: completed ?? this.completed,
		);
	}

	@override
	String toString() {
		return 'Todo{id: ${id}, content: ${content}, completed: ${completed}}';
	}
}