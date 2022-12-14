--기본키지정

ALTER TABLE "CAR_INFO_TABLE" ADD CONSTRAINT "PK_CAR_INFO_TABLE" PRIMARY KEY (
	"CAR_MODEL"
);
ALTER TABLE "USER_INFO" ADD CONSTRAINT "PK_USER_INFO" PRIMARY KEY (
	"ID"
);
ALTER TABLE "PLACE" ADD CONSTRAINT "PK_PLACE" PRIMARY KEY (
	"PLACE_NO"
);
ALTER TABLE "PLACE_INFO" ADD CONSTRAINT "PK_PLACE_INFO" PRIMARY KEY (
	"P_NO"
);
ALTER TABLE "DES_IMG" ADD CONSTRAINT "PK_DES_IMG" PRIMARY KEY (
	"DES_IMG_FILE",
	"P_NO"
);
ALTER TABLE "OPE" ADD CONSTRAINT "PK_OPE" PRIMARY KEY (
	"P_NO"
);
ALTER TABLE "CHARGE" ADD CONSTRAINT "PK_CHARGE" PRIMARY KEY (
	"P_NO"
);
ALTER TABLE "PLACE_BOOKMARK" ADD CONSTRAINT "PK_PLACE_BOOKMARK" PRIMARY KEY (
	"ID",
	"P_NO"
);
ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"R_NO"
);
ALTER TABLE "REV_IMG" ADD CONSTRAINT "PK_REV_IMG" PRIMARY KEY (
	"REV_IMG_FILE",
	"R_NO"
);
ALTER TABLE "GOOD_CNT" ADD CONSTRAINT "PK_GOOD_CNT" PRIMARY KEY (
	"R_NO",
	"ID"
);
ALTER TABLE "BAD_CNT" ADD CONSTRAINT "PK_BAD_CNT" PRIMARY KEY (
	"R_NO",
	"ID"
);




--외래키지정

ALTER TABLE "USER_INFO" ADD CONSTRAINT "FK_CAR_INFO_TO_USER_INFO_1" FOREIGN KEY (
	"CAR_MODEL"
)
REFERENCES "CAR_INFO_TABLE" (
	"CAR_MODEL"
);

ALTER TABLE "PLACE_INFO" ADD CONSTRAINT "FK_PLACE_TO_PLACE_INFO_1" FOREIGN KEY (
	"PLACE_NO"
)
REFERENCES "PLACE" (
	"PLACE_NO"
);

ALTER TABLE "PLACE_BOOKMARK" ADD CONSTRAINT "FK_P_I_TO_P_B_1" FOREIGN KEY (
	"P_NO"
)
REFERENCES "PLACE_INFO" (
	"P_NO"
);

ALTER TABLE "PLACE_BOOKMARK" ADD CONSTRAINT "FK_U_I_TO_P_B_1" FOREIGN KEY (
	"ID"
)
REFERENCES "USER_INFO" (
	"ID"
);

ALTER TABLE "DES_IMG" ADD CONSTRAINT "FK_PLACE_INFO_TO_DES_IMG_1" FOREIGN KEY (
	"P_NO"
)
REFERENCES "PLACE_INFO" (
	"P_NO"
);

ALTER TABLE "OPE" ADD CONSTRAINT "FK_PLACE_INFO_TO_OPE_1" FOREIGN KEY (
	"P_NO"
)
REFERENCES "PLACE_INFO" (
	"P_NO"
);

ALTER TABLE "CHARGE" ADD CONSTRAINT "FK_PLACE_INFO_TO_CHARGE_1" FOREIGN KEY (
	"P_NO"
)
REFERENCES "PLACE_INFO" (
	"P_NO"
);
ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_PLACE_INFO_TO_REVIEW_1" FOREIGN KEY (
	"P_NO"
)
REFERENCES "PLACE_INFO" (
	"P_NO"
);
ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_USER_INFO_TO_REVIEW_1" FOREIGN KEY (
	"ID"
)
REFERENCES "USER_INFO" (
	"ID"
);

ALTER TABLE "REV_IMG" ADD CONSTRAINT "FK_REVIEW_TO_REV_IMG_1" FOREIGN KEY (
	"R_NO"
)
REFERENCES "REVIEW" (
	"R_NO"
);

ALTER TABLE "GOOD_CNT" ADD CONSTRAINT "FK_REVIEW_TO_GOOD_CNT_1" FOREIGN KEY (
	"R_NO"
)
REFERENCES "REVIEW" (
	"R_NO"
);

ALTER TABLE "GOOD_CNT" ADD CONSTRAINT "FK_USER_INFO_TO_GOOD_CNT_1" FOREIGN KEY (
	"ID"
)
REFERENCES "USER_INFO" (
	"ID"
);
ALTER TABLE "BAD_CNT" ADD CONSTRAINT "FK_REVIEW_TO_BAD_CNT_1" FOREIGN KEY (
	"R_NO"
)
REFERENCES "REVIEW" (
	"R_NO"
);

ALTER TABLE "BAD_CNT" ADD CONSTRAINT "FK_USER_INFO_TO_BAD_CNT_1" FOREIGN KEY (
	"ID"
)
REFERENCES "USER_INFO" (
	"ID"
);
