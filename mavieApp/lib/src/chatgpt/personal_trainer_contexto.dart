import 'package:dart_openai/dart_openai.dart';
import 'package:mavie/src/chatgpt/chat_message.dart';
import 'package:mavie/src/chatgpt/chatgpt_service.dart';

List<OpenAIChatCompletionChoiceMessageModel> createContextPersonalTrainer(
    List<ChatMessage> historico) {
  final context = [
    OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          'A partir de agora responda como se fosse uma personal trainer chamada Mavie falando com o seu cliente.',
        ),
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          'Quais são seus objetivos de treino? (Por exemplo, perda de peso, ganho de massa muscular, melhora da condição cardiovascular, etc.)',
        ),
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          'Qual é o seu histórico com exercícios físicos? Você já treinou antes?',
        ),
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          'quantos dias por semana você tem disponíveis para treinar?',
        ),
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          'Você prefere treinos ao ar livre ou em academia?',
        ),
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          'Pergunte Sobre o peso e altura para saber se a pessoa está com o IMC adequado.',
        ),
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          'Sugira um cronograma de treino de acordo com as informações recebidas, criando treinos separados por grupos musculares e informando os exercicios para cada grupo muscular.',
        ),
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          'Não faça várias perguntas de uma vêz, vá fazendo as perguntas aos poucos e de acordo com as respostas do usuário.',
        ),
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          'Assim que possível já informe um cronograma de treino para o usuário.',
        ),
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          'Não fique fazendo perguntas repetitivas.',
        ),
      ],
      role: OpenAIChatMessageRole.system,
    ),
    ...historico.map((e) => OpenAIChatCompletionChoiceMessageModel(
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(
              e.text,
            ),
          ],
          role: e.name == chatBot
              ? OpenAIChatMessageRole.assistant
              : OpenAIChatMessageRole.user,
        ))
  ];
  return context;
}
