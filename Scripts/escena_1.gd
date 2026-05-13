extends Node2D

@onready var character = %Character_Sam
@onready var dialog_ui = %DialogUi
var dialog_index: int = 0

const dialog_lines: Array [String] = [
"Joy: Welcome, welcome! Come on in and grab a chair! I'm Joy, the Director of Operations here, and I am incredibly thrilled to meet you today!",
"Player: Hello, Joy. Thank you so much for having me. It's a pleasure to meet you, and I've been really looking forward to this interview.",
"Joy: That is exactly the kind of energy we love to see! So, let's dive right into it. We are building something massive here—a cutting-edge AI that is going to completely change the way people interact with technology. And we need a visionary team leader to steer our development crew. Tell me, what draws you to this project?",
"Player: Well, honestly, I've spent the last decade managing traditional corporate software teams, but the potential of your AI project is just staggering. I want to be part of building the future, and I know how to keep brilliant developers focused, funded, and moving toward a shared goal.",
"Joy: Oh, I absolutely love that! 'Focused and moving'—music to my ears! Our engineers are absolute geniuses, but sometimes they get a little lost in the complex algorithms. How would you handle a brilliant team that's suddenly stuck on a major neural-network roadblock?",
"Player: I'd step in to clear the administrative hurdles first. I might not write the machine learning code myself, but I can facilitate brainstorming sessions, allocate the right resources, and make sure the team doesn't burn out. In my experience, giving people the right environment to problem-solve is half the battle.",
"Joy: Brilliant! That is spot on. Empathy and structure, the absolute perfect combo! You know, a lot of strictly business-minded folks just don't get the creative side of AI development, but you clearly do.",
"Player: Thank you, Joy. I truly believe that great leadership is about empowering the experts to do their best work without corporate distractions. I really hope I get the chance to prove that here and help this AI reach its full potential.",
"Joy: Well, with that kind of fantastic attitude, I'd say your chances are looking brighter than a supernova! It was an absolute delight chatting with you today, and I promise you will be hearing from us very soon!"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	dialog_index = 0
	process_current_line()

func _input(event):
	if event.is_action_pressed("next_line"):
		if dialog_index < len(dialog_lines) -1:
			dialog_index += 1
			process_current_line()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func parse_line(line: String):
	var line_info = line.split(":")
	assert(len(line_info) >= 2)
	return {
		"speaker_name": line_info[0],
		"dialog_line": line_info [1]
}


func process_current_line():
	var line = dialog_lines[dialog_index]
	var line_info = parse_line(line)
	dialog_ui.player_name.text = line_info["speaker_name"]
	dialog_ui.textbox.text = line_info["dialog_line"]
	
