def get_meta(obj):
	title = ""
	if obj.meta_title:
		title = obj.meta_title
	else:
		title = obj.name
	description = obj.meta_description
	keywords = obj.meta_keywords
	return title, description, keywords
