DROP DATABASE if exists `innisfree`;
CREATE SCHEMA `innisfree` ;
use innisfree;
DROP TABLE IF EXISTS `Member`;

CREATE TABLE `Member` (
	`me_email`	varchar(50)	NOT NULL,
	`me_pw`	varchar(255)	NULL,
	`me_name`	varchar(10)	NULL,
	`me_birth`	date	NULL,
	`me_phonenum`	varchar(20)	NULL,
	`me_post_code`	varchar(10)	NULL,
	`me_addr`	varchar(50)	NULL,
	`me_addr_detail`	varchar(50)	NULL,
	`me_s_email`	varchar(50)	NULL,
	`me_s_limit`	datetime	NULL,
	`me_code`	char(10)	NULL,
	`me_pos`	enum("0","1")	NULL,
	`me_pos_count`	int	NULL,
	`me_authority`	int	NULL,
	`me_gr_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `Product`;

CREATE TABLE `Product` (
	`pr_code`	char(10)	NOT NULL,
	`pr_thumb`	varchar(255)	NULL,
	`pr_title`	varchar(255)	NULL,
	`pr_title_detail`	longtext	NULL,
	`pr_content`	longtext	NULL,
	`pr_price`	int	NULL,
	`pr_deli`	int	NULL,
	`pr_point`	int	NULL,
	`pr_sc_code` varchar(10)	NOT NULL,
	`pr_amount`	int	NULL
);

DROP TABLE IF EXISTS `likes`;

CREATE TABLE `likes` (
	`li_num`	int	NOT NULL,
	`li_pr_code`	char(10)	NOT NULL,
	`li_me_email`	varchar(50)	NOT NULL
);

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
	`ca_num`	int	NOT NULL,
	`ca_pr_code`	char(10)	NOT NULL,
	`ca_me_email`	varchar(50)	NOT NULL,
	`ca_pr_amount`	int	NULL
);

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
	`or_code`	varchar(20)	NOT NULL,
	`or_pr_code`	char(10)	NOT NULL,
	`or_me_email`	varchar(50)	NOT NULL,
	`or_name`	varchar(10)	NULL,
	`or_date`	datetime	NULL,
	`or_post_code`	varchar(10)	NULL,
	`or_addr`	varchar(50)	NULL,
	`or_addr_detail`	varchar(50)	NULL,
	`or_amount`	int	NULL,
	`or_price`	int	NULL,
	`or_total_price`	int	NULL,
	`or_state`	varchar(20)	NULL,
	`or_deli`	int	NULL,
	`or_point`	int	NULL,
	`or_coupon`	varchar(50)	NULL,
	`or_hc_num`	int	NOT NULL,
	`or_refund_date`	datetime	NULL
);

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
	`re_num`	int	NOT NULL,
	`re_pr_code`	char(10)	NOT NULL,
	`re_me_email`	varchar(50)	NOT NULL,
	`re_title`	varchar(255)	NULL,
	`re_content`	longtext	NULL,
	`re_date`	datetime	NULL,
	`re_reg_date`	datetime	NULL,
	`re_star`	int	NULL
);

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
	`fi_num`	int	NOT NULL,
	`fi_name`	varchar(255)	NULL,
	`fi_ori_name`	varchar(255)	NULL,
	`fi_table_name`	varchar(20)	NULL,
	`fi_number`	int	NULL
);

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
	`no_num`	int	NOT NULL,
	`no_type`	varchar(10)	NULL,
	`no_title`	varchar(255)	NULL,
	`no_content`	longtext	NULL,
	`no_reg_date`	datetime	NULL,
	`no_me_email`	varchar(50)	NOT NULL
);

DROP TABLE IF EXISTS `Large_Category`;

CREATE TABLE `Large_Category` (
	`lc_code`	varchar(10)	NOT NULL,
	`lc_name`	varchar(50)	NULL
);

DROP TABLE IF EXISTS `Midium_Cartegory`;

CREATE TABLE `Midium_Cartegory` (
	`mc_code`	varchar(10)	NOT NULL,
	`mc_lc_code`	varchar(10)	NOT NULL,
	`mc_name`	varchar(50)	NULL
);

DROP TABLE IF EXISTS `Small_Cartegory`;

CREATE TABLE `Small_Cartegory` (
	`sc_code`	varchar(10)	NOT NULL,
	`sc_mc_code`	varchar(10)	NOT NULL,
	`sc_name`	varchar(50)	NULL,
	`sc_count`	int	NULL
);

DROP TABLE IF EXISTS `back`;

CREATE TABLE `back` (
	`ba_code`	varchar(20)	NOT NULL,
	`ba_date`	datetime	NULL,
	`ba_state`	varchar(20)	NULL,
	`ba_total_price`	int	NULL,
	`ba_total_point`	int	NULL,
	`ba_content`	longtext	NULL
);

DROP TABLE IF EXISTS `Order_Detail`;

CREATE TABLE `Order_Detail` (
	`od_code`	varchar(20)	NOT NULL,
	`od_or_code`	varchar(20)	NOT NULL,
	`od_amount`	int	NULL,
	`od_pr_code`	char(10)	NOT NULL
);

DROP TABLE IF EXISTS `Back_Detail`;

CREATE TABLE `Back_Detail` (
	`bd_code`	varchar(20)	NOT NULL,
	`bd_ba_code`	varchar(20)	NOT NULL,
	`bd_od_code`	varchar(20)	NOT NULL,
	`bd_amount`	int	NULL,
	`bd_price`	int	NULL,
	`bd_point`	int	NULL
);

DROP TABLE IF EXISTS `grade`;

CREATE TABLE `grade` (
	`gr_num`	int	NOT NULL,
	`gr_name`	varchar(10)	NULL,
	`gr_dis`	int	NULL,
	`gr_date`	datetime	NULL
);

DROP TABLE IF EXISTS `Inquiry`;

CREATE TABLE `Inquiry` (
	`in_num`	int	NOT NULL,
	`in_me_email`	varchar(50)	NOT NULL,
	`in_pr_code`	char(10)	NOT NULL,
	`in_buy`	enum('0','1')	NULL,
	`in_secret`	enum('0','1')	NULL,
	`in_answer`	enum('0','1')	NULL,
	`in_option`	varchar(100)	NULL,
	`in_title`	varchar(255)	NULL,
	`in_content`	longtext	NULL,
	`in_date`	datetime	NULL,
	`in_ori_num`	int	NULL
);

DROP TABLE IF EXISTS `Delivery_Fee`;

CREATE TABLE `Delivery_Fee` (
	`df_deli`	int	NULL,
	`df_ free_stan`	varchar(255)	NULL
);

DROP TABLE IF EXISTS `coupon`;

CREATE TABLE `coupon` (
	`co_num`	int	NOT NULL,
	`co_name`	varchar(255)	NULL,
	`co_price`	int	NULL,
	`co_content`	varchar(255)	NULL,
	`co_ex_date`	datetime	NULL
);

DROP TABLE IF EXISTS `Holding_Coupon`;

CREATE TABLE `Holding_Coupon` (
	`hc_num`	int	NOT NULL,
	`hc_co_num`	int	NOT NULL,
	`hc_me_email`	varchar(50)	NOT NULL
);

ALTER TABLE `Member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`me_email`
);

ALTER TABLE `Product` ADD CONSTRAINT `PK_PRODUCT` PRIMARY KEY (
	`pr_code`
);

ALTER TABLE `likes` ADD CONSTRAINT `PK_LIKES` PRIMARY KEY (
	`li_num`
);

ALTER TABLE `cart` ADD CONSTRAINT `PK_CART` PRIMARY KEY (
	`ca_num`
);

ALTER TABLE `order` ADD CONSTRAINT `PK_ORDER` PRIMARY KEY (
	`or_code`
);

ALTER TABLE `review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`re_num`
);

ALTER TABLE `file` ADD CONSTRAINT `PK_FILE` PRIMARY KEY (
	`fi_num`
);

ALTER TABLE `notice` ADD CONSTRAINT `PK_NOTICE` PRIMARY KEY (
	`no_num`
);

ALTER TABLE `Large_Category` ADD CONSTRAINT `PK_LARGE_CATEGORY` PRIMARY KEY (
	`lc_code`
);

ALTER TABLE `Midium_Cartegory` ADD CONSTRAINT `PK_MIDIUM_CARTEGORY` PRIMARY KEY (
	`mc_code`
);

ALTER TABLE `Small_Cartegory` ADD CONSTRAINT `PK_SMALL_CARTEGORY` PRIMARY KEY (
	`sc_code`
);

ALTER TABLE `back` ADD CONSTRAINT `PK_BACK` PRIMARY KEY (
	`ba_code`
);

ALTER TABLE `Order_Detail` ADD CONSTRAINT `PK_ORDER_DETAIL` PRIMARY KEY (
	`od_code`
);

ALTER TABLE `Back_Detail` ADD CONSTRAINT `PK_BACK_DETAIL` PRIMARY KEY (
	`bd_code`
);

ALTER TABLE `grade` ADD CONSTRAINT `PK_GRADE` PRIMARY KEY (
	`gr_num`
);

ALTER TABLE `Inquiry` ADD CONSTRAINT `PK_INQUIRY` PRIMARY KEY (
	`in_num`
);

ALTER TABLE `coupon` ADD CONSTRAINT `PK_COUPON` PRIMARY KEY (
	`co_num`
);

ALTER TABLE `Holding_Coupon` ADD CONSTRAINT `PK_HOLDING_COUPON` PRIMARY KEY (
	`hc_num`
);

ALTER TABLE `Member` ADD CONSTRAINT `FK_grade_TO_Member_1` FOREIGN KEY (
	`me_gr_num`
)
REFERENCES `grade` (
	`gr_num`
);

ALTER TABLE `Product` ADD CONSTRAINT `FK_Small_Cartegory_TO_Product_1` FOREIGN KEY (
	`pr_sc_code`
)
REFERENCES `Small_Cartegory` (
	`sc_code`
);

ALTER TABLE `likes` ADD CONSTRAINT `FK_Product_TO_likes_1` FOREIGN KEY (
	`li_pr_code`
)
REFERENCES `Product` (
	`pr_code`
);

ALTER TABLE `likes` ADD CONSTRAINT `FK_Member_TO_likes_1` FOREIGN KEY (
	`li_me_email`
)
REFERENCES `Member` (
	`me_email`
);

ALTER TABLE `cart` ADD CONSTRAINT `FK_Product_TO_cart_1` FOREIGN KEY (
	`ca_pr_code`
)
REFERENCES `Product` (
	`pr_code`
);

ALTER TABLE `cart` ADD CONSTRAINT `FK_Member_TO_cart_1` FOREIGN KEY (
	`ca_me_email`
)
REFERENCES `Member` (
	`me_email`
);

ALTER TABLE `order` ADD CONSTRAINT `FK_Product_TO_order_1` FOREIGN KEY (
	`or_pr_code`
)
REFERENCES `Product` (
	`pr_code`
);

ALTER TABLE `order` ADD CONSTRAINT `FK_Member_TO_order_1` FOREIGN KEY (
	`or_me_email`
)
REFERENCES `Member` (
	`me_email`
);

ALTER TABLE `order` ADD CONSTRAINT `FK_Holding_Coupon_TO_order_1` FOREIGN KEY (
	`or_hc_num`
)
REFERENCES `Holding_Coupon` (
	`hc_num`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_Product_TO_review_1` FOREIGN KEY (
	`re_pr_code`
)
REFERENCES `Product` (
	`pr_code`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_Member_TO_review_1` FOREIGN KEY (
	`re_me_email`
)
REFERENCES `Member` (
	`me_email`
);

ALTER TABLE `notice` ADD CONSTRAINT `FK_Member_TO_notice_1` FOREIGN KEY (
	`no_me_email`
)
REFERENCES `Member` (
	`me_email`
);

ALTER TABLE `Midium_Cartegory` ADD CONSTRAINT `FK_Large_Category_TO_Midium_Cartegory_1` FOREIGN KEY (
	`mc_lc_code`
)
REFERENCES `Large_Category` (
	`lc_code`
);

ALTER TABLE `Small_Cartegory` ADD CONSTRAINT `FK_Midium_Cartegory_TO_Small_Cartegory_1` FOREIGN KEY (
	`sc_mc_code`
)
REFERENCES `Midium_Cartegory` (
	`mc_code`
);

ALTER TABLE `Order_Detail` ADD CONSTRAINT `FK_order_TO_Order_Detail_1` FOREIGN KEY (
	`od_or_code`
)
REFERENCES `order` (
	`or_code`
);

ALTER TABLE `Order_Detail` ADD CONSTRAINT `FK_Product_TO_Order_Detail_1` FOREIGN KEY (
	`od_pr_code`
)
REFERENCES `Product` (
	`pr_code`
);

ALTER TABLE `Back_Detail` ADD CONSTRAINT `FK_back_TO_Back_Detail_1` FOREIGN KEY (
	`bd_ba_code`
)
REFERENCES `back` (
	`ba_code`
);

ALTER TABLE `Back_Detail` ADD CONSTRAINT `FK_Order_Detail_TO_Back_Detail_1` FOREIGN KEY (
	`bd_od_code`
)
REFERENCES `Order_Detail` (
	`od_code`
);

ALTER TABLE `Inquiry` ADD CONSTRAINT `FK_Member_TO_Inquiry_1` FOREIGN KEY (
	`in_me_email`
)
REFERENCES `Member` (
	`me_email`
);

ALTER TABLE `Inquiry` ADD CONSTRAINT `FK_Product_TO_Inquiry_1` FOREIGN KEY (
	`in_pr_code`
)
REFERENCES `Product` (
	`pr_code`
);

ALTER TABLE `Holding_Coupon` ADD CONSTRAINT `FK_coupon_TO_Holding_Coupon_1` FOREIGN KEY (
	`hc_co_num`
)
REFERENCES `coupon` (
	`co_num`
);

ALTER TABLE `Holding_Coupon` ADD CONSTRAINT `FK_Member_TO_Holding_Coupon_1` FOREIGN KEY (
	`hc_me_email`
)
REFERENCES `Member` (
	`me_email`
);