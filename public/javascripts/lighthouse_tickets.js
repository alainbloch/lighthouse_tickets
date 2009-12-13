var LighthouseTicket = {
  toggle:function(invoke_action)	{
		if (invoke_action == "show")	{
			$('create_ticket_form').show();
			$('lighthouse_ticket_title_field').value="";
			$('lighthouse_ticket_description_field').value="";
			$('lighthouse_ticket_priority_field').selectedindex=2;
			$('submitting_ticket').hide();
			$('submit_ticket').show();
		} else	{
			$('create_ticket_form').hide();
		}
	}

}