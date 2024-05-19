class Job {
  SearchMetadata? searchMetadata;
  SearchParameters? searchParameters;
  List<JobsResults>? jobsResults;
  List<Chips>? chips;

  Job({
    this.searchMetadata,
    this.searchParameters,
    this.jobsResults,
    this.chips,
  });

  Job.fromJson(Map<String, dynamic> json) {
    searchMetadata = json['search_metadata'] != null
        ? SearchMetadata.fromJson(json['search_metadata'])
        : null;
    searchParameters = json['search_parameters'] != null
        ? SearchParameters.fromJson(json['search_parameters'])
        : null;

    if (json['jobs_results'] != null) {
      jobsResults = <JobsResults>[];

      json['jobs_results'].forEach((v) {
        jobsResults!.add(JobsResults.fromJson(v));
      });
    }

    if (json['chips'] != null) {
      chips = <Chips>[];
      json['chips'].forEach((v) {
        chips!.add(Chips.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (searchMetadata != null) {
      data['search_metadata'] = searchMetadata!.toJson();
    }

    if (searchParameters != null) {
      data['search_parameters'] = searchParameters!.toJson();
    }

    if (jobsResults != null) {
      data['jobs_results'] = jobsResults!.map((v) => v.toJson()).toList();
    }

    if (chips != null) {
      data['chips'] = chips!.map((v) => v.toJson()).toList();
    }

    return data;
  }

  @override
  String toString() {
    return '''
          jobsResult: ${jobsResults.toString()}
          ''';
  }
}

class SearchMetadata {
  String? id;
  String? status;
  String? jsonEndpoint;
  String? createdAt;
  String? processedAt;
  String? googleJobsUrl;
  String? rawHtmlFile;
  double? totalTimeTaken;

  SearchMetadata({
    this.id,
    this.status,
    this.jsonEndpoint,
    this.createdAt,
    this.processedAt,
    this.googleJobsUrl,
    this.rawHtmlFile,
    this.totalTimeTaken,
  });

  SearchMetadata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    jsonEndpoint = json['json_endpoint'];
    createdAt = json['created_at'];
    processedAt = json['processed_at'];
    googleJobsUrl = json['google_jobs_url'];
    rawHtmlFile = json['raw_html_file'];
    totalTimeTaken = json['total_time_taken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['json_endpoint'] = jsonEndpoint;
    data['created_at'] = createdAt;
    data['processed_at'] = processedAt;
    data['google_jobs_url'] = googleJobsUrl;
    data['raw_html_file'] = rawHtmlFile;
    data['total_time_taken'] = totalTimeTaken;
    return data;
  }
}

class SearchParameters {
  String? q;
  String? engine;
  String? googleDomain;
  String? hl;
  int? start;

  SearchParameters({
    this.q,
    this.engine,
    this.googleDomain,
    this.hl,
    this.start,
  });

  SearchParameters.fromJson(Map<String, dynamic> json) {
    q = json['q'];
    engine = json['engine'];
    googleDomain = json['google_domain'];
    hl = json['hl'];
    start = json['start'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['q'] = q;
    data['engine'] = engine;
    data['google_domain'] = googleDomain;
    data['hl'] = hl;
    data['start'] = start;

    return data;
  }
}

class JobsResults {
  String? title;
  String? companyName;
  String? location;
  String? via;
  String? description;
  List<JobHighlights>? jobHighlights;
  List<RelatedLinks>? relatedLinks;
  String? thumbnail;
  List<String>? extensions;
  DetectedExtensions? detectedExtensions;
  String? jobId;

  JobsResults({
    this.title,
    this.companyName,
    this.location,
    this.via,
    this.description,
    this.jobHighlights,
    this.relatedLinks,
    this.thumbnail,
    this.extensions,
    this.detectedExtensions,
    this.jobId,
  });

  JobsResults.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    companyName = json['company_name'];
    location = json['location'];
    via = json['via'];
    description = json['description'];

    if (json['job_highlights'] != null) {
      jobHighlights = <JobHighlights>[];
      json['job_highlights'].forEach((v) {
        jobHighlights!.add(JobHighlights.fromJson(v));
      });
    }

    if (json['related_links'] != null) {
      relatedLinks = <RelatedLinks>[];
      json['related_links'].forEach((v) {
        relatedLinks!.add(RelatedLinks.fromJson(v));
      });
    }

    thumbnail = json['thumbnail'];
    extensions = json['extensions'].cast<String>();
    detectedExtensions = json['detected_extensions'] != null
        ? DetectedExtensions.fromJson(json['detected_extensions'])
        : null;
    jobId = json['job_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = title;
    data['company_name'] = companyName;
    data['location'] = location;
    data['via'] = via;
    data['description'] = description;

    if (jobHighlights != null) {
      data['job_highlights'] = jobHighlights!.map((v) => v.toJson()).toList();
    }

    if (relatedLinks != null) {
      data['related_links'] = relatedLinks!.map((v) => v.toJson()).toList();
    }

    data['thumbnail'] = thumbnail;
    data['extensions'] = extensions;

    if (detectedExtensions != null) {
      data['detected_extensions'] = detectedExtensions!.toJson();
    }

    data['job_id'] = jobId;
    return data;
  }

  @override
  String toString() {
    return '$location';
  }
}

class JobHighlights {
  List<String>? items;

  JobHighlights({this.items});

  JobHighlights.fromJson(Map<String, dynamic> json) {
    items = json['items'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items'] = items;

    return data;
  }
}

class RelatedLinks {
  String? link;
  String? text;

  RelatedLinks({this.link, this.text});

  RelatedLinks.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['link'] = link;
    data['text'] = text;

    return data;
  }
}

class DetectedExtensions {
  String? postedAt;
  String? scheduleType;

  DetectedExtensions({this.postedAt, this.scheduleType});

  DetectedExtensions.fromJson(Map<String, dynamic> json) {
    postedAt = json['posted_at'];
    scheduleType = json['schedule_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['posted_at'] = postedAt;
    data['schedule_type'] = scheduleType;

    return data;
  }
}

class Chips {
  String? type;
  String? param;
  List<Options>? options;

  Chips({this.type, this.param, this.options});

  Chips.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    param = json['param'];

    if (json['options'] != null) {
      options = <Options>[];

      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['param'] = param;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  String? text;
  String? value;

  Options({this.text, this.value});

  Options.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['value'] = value;

    return data;
  }
}
