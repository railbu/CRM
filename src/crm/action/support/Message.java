package crm.action.support;

public class Message {

	private String content;
	private MessageType type;
	private String backView;
	
	public Message(String content, String backView, MessageType type) {
		super();
		this.content = content;
		this.type = type;
		this.backView = backView;
	}

	public String getContent() {
		return content;
	}
	
	public MessageType getType() {
		return type;
	}

	public String getBackView() {
		return backView;
	}
	
	
}
