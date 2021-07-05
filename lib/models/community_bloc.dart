class Community {
  late bool status;
 late  String msg;
 late List<CommunityData> data;
  late int requestCount;

  Community({required this.status, required this.msg, required this.data, required this.requestCount});

  Community.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <CommunityData>[];
      json['data'].forEach((v) {
        data.add(new CommunityData.fromJson(v));
      });
    }
    requestCount = json['request_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['request_count'] = this.requestCount;
    return data;
  }
}

class CommunityData {
  late int defaultCommunityInfoId;
  late String payAmount;
  late String payFrequency;
  late String potSelection;
  late String communityType;
  late int adminId;
  late String communityName;
  late int communityId;
  late String communityPaymentMethod;
  late String communityCommunityModel;
  late bool isDelete;
  late String adminEmail;
  late String adminName;
  late String amount;
  late List<CycleDetails> cycleDetails;
  late List<CommunityMembers> communityMembers;
  late List<AssignedFacilitator> assignedFacilitator;

  CommunityData(
      {required this.defaultCommunityInfoId,
        required this.payAmount,
        required this.payFrequency,
        required this.potSelection,
        required this.communityType,
        required this.adminId,
        required this.communityName,
        required this.communityId,
        required this.communityPaymentMethod,
        required this.communityCommunityModel,
        required this.isDelete,
        required this.adminEmail,
        required this.adminName,
        required this.amount,
        required this.cycleDetails,
        required this.communityMembers,
        required this.assignedFacilitator});

  CommunityData.fromJson(Map<String, dynamic> json) {
    defaultCommunityInfoId = json['default_community_info_id'];
    payAmount = json['pay_amount'];
    payFrequency = json['pay_frequency'];
    potSelection = json['pot_selection'];
    communityType = json['community_type'];
    adminId = json['admin_id'];
    communityName = json['community_name'];
    communityId = json['community_id'];
    communityPaymentMethod = json['community_payment_method'];
    communityCommunityModel = json['community_community_model'];
    isDelete = json['isDelete'];
    adminEmail = json['admin_email'];
    adminName = json['admin_name'];
    amount = json['amount'];
    if (json['cycle_details'] != null) {
      cycleDetails = <CycleDetails>[];
      json['cycle_details'].forEach((v) {
        cycleDetails.add(new CycleDetails.fromJson(v));
      });
    }
    if (json['community_members'] != null) {
      communityMembers =<CommunityMembers>[];
      json['community_members'].forEach((v) {
        communityMembers.add(new CommunityMembers.fromJson(v));
      });
    }
    if (json['assigned_facilitator'] != null) {
      assignedFacilitator = <AssignedFacilitator>[];
      json['assigned_facilitator'].forEach((v) {
        assignedFacilitator.add(new AssignedFacilitator.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['default_community_info_id'] = this.defaultCommunityInfoId;
    data['pay_amount'] = this.payAmount;
    data['pay_frequency'] = this.payFrequency;
    data['pot_selection'] = this.potSelection;
    data['community_type'] = this.communityType;
    data['admin_id'] = this.adminId;
    data['community_name'] = this.communityName;
    data['community_id'] = this.communityId;
    data['community_payment_method'] = this.communityPaymentMethod;
    data['community_community_model'] = this.communityCommunityModel;
    data['isDelete'] = this.isDelete;
    data['admin_email'] = this.adminEmail;
    data['admin_name'] = this.adminName;
    data['amount'] = this.amount;
    if (this.cycleDetails != null) {
      data['cycle_details'] = this.cycleDetails.map((v) => v.toJson()).toList();
    }
    if (this.communityMembers != null) {
      data['community_members'] =
          this.communityMembers.map((v) => v.toJson()).toList();
    }
    if (this.assignedFacilitator != null) {
      data['assigned_facilitator'] =
          this.assignedFacilitator.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CycleDetails {
  late int id;
  late int communityId;
  late String amount;
  late int currentCycleNo;
  late String endDate;
  late String frequency;
  late String nextCycleDate;
  late int nextPayoutMember;
  late String potSelection;
  late Null communityType;
  late String startDate;
  late String status;
  late String createdAt;
  late String updatedAt;
  late String createdIp;
  late String updatedIp;
  late int payoutAmount;
  late bool isTermsConditionAccepted;

  CycleDetails(
      {required this.id,
        required this.communityId,
        required this.amount,
        required this.currentCycleNo,
        required this.endDate,
        required this.frequency,
        required this.nextCycleDate,
        required this.nextPayoutMember,
        required this.potSelection,
        required this.communityType,
        required this.startDate,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.createdIp,
        required this.updatedIp,
        required this.payoutAmount,
        required this.isTermsConditionAccepted});

  CycleDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    communityId = json['community_id'];
    amount = json['amount'];
    currentCycleNo = json['current_cycle_no'];
    endDate = json['end_date'];
    frequency = json['frequency'];
    nextCycleDate = json['next_cycle_date'];
    nextPayoutMember = json['next_payout_member'];
    potSelection = json['pot_selection'];
    communityType = json['community_type'];
    startDate = json['start_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdIp = json['created_ip'];
    updatedIp = json['updated_ip'];
    payoutAmount = json['payout_amount'];
    isTermsConditionAccepted = json['isTermsConditionAccepted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['community_id'] = this.communityId;
    data['amount'] = this.amount;
    data['current_cycle_no'] = this.currentCycleNo;
    data['end_date'] = this.endDate;
    data['frequency'] = this.frequency;
    data['next_cycle_date'] = this.nextCycleDate;
    data['next_payout_member'] = this.nextPayoutMember;
    data['pot_selection'] = this.potSelection;
    data['community_type'] = this.communityType;
    data['start_date'] = this.startDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_ip'] = this.createdIp;
    data['updated_ip'] = this.updatedIp;
    data['payout_amount'] = this.payoutAmount;
    data['isTermsConditionAccepted'] = this.isTermsConditionAccepted;
    return data;
  }
}

class CommunityMembers {
  late int id;
  late String memberType;
  late String payoutDate;
  late String fullName;
  late int userId;
  late String approvalStatus;
  late bool payoutStatus;
  late String photoUriPath;

  CommunityMembers(
      {required this.id,
        required this.memberType,
        required this.payoutDate,
        required this.fullName,
        required this.userId,
        required this.approvalStatus,
        required this.payoutStatus,
        required this.photoUriPath});

  CommunityMembers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberType = json['member_type'];
    payoutDate = json['payout_date'];
    fullName = json['full_name'];
    userId = json['user_id'];
    approvalStatus = json['approval_status'];
    payoutStatus = json['payout_status'];
    photoUriPath = json['photo_uri_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['member_type'] = this.memberType;
    data['payout_date'] = this.payoutDate;
    data['full_name'] = this.fullName;
    data['user_id'] = this.userId;
    data['approval_status'] = this.approvalStatus;
    data['payout_status'] = this.payoutStatus;
    data['photo_uri_path'] = this.photoUriPath;
    return data;
  }
}

class AssignedFacilitator {
  late int userId;
  late String fullName;
  late String photoUri;
  late String photoUriPath;

  AssignedFacilitator(
      {required this.userId, required this.fullName, required this.photoUri, required this.photoUriPath});

  AssignedFacilitator.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fullName = json['full_name'];
    photoUri = json['photo_uri'];
    photoUriPath = json['photo_uri_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['full_name'] = this.fullName;
    data['photo_uri'] = this.photoUri;
    data['photo_uri_path'] = this.photoUriPath;
    return data;
  }
}
