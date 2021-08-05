package com.kokochi.samp.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString @AllArgsConstructor
public class ManagedFollow {
	private String user_id;
	private String to_user;
}
