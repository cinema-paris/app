class SourceMovieEntity {
	List<SourceMovieData> data;

	SourceMovieEntity({this.data});

	SourceMovieEntity.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<SourceMovieData>();(json['data'] as List).forEach((v) { data.add(new SourceMovieData.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class SourceMovieData {
	SourceMovieDataAttributes attributes;
	String id;
	String type;

	SourceMovieData({this.attributes, this.id, this.type});

	SourceMovieData.fromJson(Map<String, dynamic> json) {
		attributes = json['attributes'] != null ? new SourceMovieDataAttributes.fromJson(json['attributes']) : null;
		id = json['id'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.attributes != null) {
      data['attributes'] = this.attributes.toJson();
    }
		data['id'] = this.id;
		data['type'] = this.type;
		return data;
	}
}

class SourceMovieDataAttributes {
	String overview;
	String backdropUrl;
	String originalLanguage;
	String originalTitle;
	String releaseDate;
	String posterUrl;
	String title;

	SourceMovieDataAttributes({this.overview, this.backdropUrl, this.originalLanguage, this.originalTitle, this.releaseDate, this.posterUrl, this.title});

	SourceMovieDataAttributes.fromJson(Map<String, dynamic> json) {
		overview = json['overview'];
		backdropUrl = json['backdrop_url'];
		originalLanguage = json['original_language'];
		originalTitle = json['original_title'];
		releaseDate = json['release_date'];
		posterUrl = json['poster_url'];
		title = json['title'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['overview'] = this.overview;
		data['backdrop_url'] = this.backdropUrl;
		data['original_language'] = this.originalLanguage;
		data['original_title'] = this.originalTitle;
		data['release_date'] = this.releaseDate;
		data['poster_url'] = this.posterUrl;
		data['title'] = this.title;
		return data;
	}
}
