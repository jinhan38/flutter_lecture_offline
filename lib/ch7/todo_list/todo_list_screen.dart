import 'package:flutter/material.dart';

import 'todo_model.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TextEditingController _editingController = TextEditingController();
  final List<TodoModel> todoList = [];

  @override
  void initState() {
    super.initState();
    todoList.add(TodoModel("운동", false));
    todoList.add(TodoModel("개발 공부", true));
    todoList.add(TodoModel("요리", false));
    todoList.add(TodoModel("데이트", false));
    todoList.add(TodoModel("가나다라마바사아자카차파타하", false));
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Todo-list"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => addDialog(),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: _listView(),
    );
  }

  Widget _listView() {
    return ListView.separated(
      shrinkWrap: true,

      /// 리스트 한개에 들어갈 위젯
      itemBuilder: (context, index) {
        TodoModel todoModel = todoList[index];
        TextStyle textStyle = const TextStyle(fontSize: 18);
        if (todoModel.complete) {
          textStyle = const TextStyle(
            fontSize: 18,
            decorationStyle: TextDecorationStyle.solid,
            decoration: TextDecoration.lineThrough,
          );
        }
        return ListTile(
          /// 좌우 패딩
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),

          /// listTile의 세로 padding 값 설정
          minVerticalPadding: 20,

          /// leading 위젯, title 위젯, trainling 위젯 간의 사이 간격
          horizontalTitleGap: 10,

          /// leading = 왼쪽에 노출되는 위젯
          /// 체크박스의 사이즈조절을 하려면 scale 사용 필요
          /// ex) scale 1.2 => 크기 1.2배
          leading: Transform.scale(
            scale: 1.2,
            child: _checkBox(todoList[index]),
          ),

          /// title = 가운데 노출되는 위젯
          title:Row(
            children: [
              Text(
                "$index",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  todoModel.text,
                  style: textStyle,
                ),
              ),
            ],
          ),

          /// trailing = 오른쪽에 노출되는 위젯
          trailing: IconButton(
              onPressed: () {
                setState(() {
                  todoList.removeAt(index);
                });
              },
              icon: const Icon(Icons.delete)),
        );
      },

      /// 리스트 아이템의 사이에 들어갈 위젯
      separatorBuilder: (context, index) {
        /// 구분선
        return Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey.shade600,
        );
      },

      /// 리스트의 개수
      itemCount: todoList.length,
    );
  }

  Checkbox _checkBox(TodoModel todoModel) {
    return Checkbox(
      value: todoModel.complete,

      /// 체크박스를 누르고 있을 때 발생하는 splash 이벤트
      overlayColor: MaterialStatePropertyAll(Colors.green.withOpacity(0.2)),

      /// splash의 크기
      splashRadius: 24,

      /// MaterialTapTargetSize.padded : 최소사이즈 48x48 로 세팅
      /// MaterialTapTargetSize.shrinkWrap : Material에 의해 제공된 최소 사이즈
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

      /// 선택 안 됐을 때 테두리
      /// 선택 됐을 때 배경
      fillColor: const MaterialStatePropertyAll(Colors.green),

      /// 체크박스의 모양 변경
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),

      /// 체크박스를 클릭했을 때 호출
      onChanged: (value) {
        setState(() {
          todoModel.complete = !todoModel.complete;
        });
      },
    );
  }

  /// todoList 에 항목을 추가할 Dialog 호출
  void addDialog() async {
    /// TextFormField에 들어갈 controller 값 초기화
    _editingController.text = "";
    String? result = await showDialog(
      context: context,
      builder: (_) => _addDialogWidget(),
    );

    if (result == null) return;
    setState(() {
      todoList.add(TodoModel(result, false));
    });
  }

  Widget _addDialogWidget() {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(16),
      actionsPadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      title: const Text("Todo-list 추가"),
      titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
      content: TextFormField(
        autofocus: true,
        controller: _editingController,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        decoration: const InputDecoration(
          hintText: "입력해주세요",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ),
      actions: [
        Row(
          children: [
            /// 취소 버튼
            _dialogButton(
              text: "취소",
              backgroundColor: Colors.grey,
              onTap: () {
                Navigator.pop(context);
              },
            ),

            /// 추가 버튼
            _dialogButton(
              text: "추가",
              backgroundColor: Colors.blue,
              onTap: () {
                Navigator.pop(context, _editingController.text);
              },
            ),
          ],
        )
      ],
    );
  }

  /// 다이얼로그에서 사용할 버튼
  Widget _dialogButton({
    required String text,
    required Color backgroundColor,
    required Function() onTap,
  }) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          onTap();
        },
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          backgroundColor: backgroundColor,
          padding: EdgeInsets.zero,
          foregroundColor: Colors.white,
        ),
        child: SizedBox(
          height: 60,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
