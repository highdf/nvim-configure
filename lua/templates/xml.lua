local utils = require("new-file-template.utils")

local function Mapper_template(relative_path, filename)
	return [[<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
"https://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="|cursor|">

	<select id="" resultType="">
	</select>

	<insert id = "" useGeneratedKeys = "true" keyColumn = "" keyProperty = "">
	</insert>

	<update id = "" parameterType = "">
	</update>

</mapper>
	]]
end

local function spring_template(relative_path, filename)
	return [[<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
  http://www.springframework.org/schema/beans/spring-beans.xsd
  http://www.springframework.org/schema/context
  http://www.springframework.org/schema/context/spring-context.xsd">
  	|cursor|
</beans>
		]]
end

local function mybatis_template(relative_path, filename)
	return [[<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
	<!-- 配置全局属性 -->
	<settings>
		<!-- 使用jdbc的getGeneratedKeys获取数据库自增主键值 -->
		<setting name="useGeneratedKeys" value="true" />

		<!-- 使用列别名替换列名 默认:true -->
		<setting name="useColumnLabel" value="true" />

		<!-- 开启驼峰命名转换:Table{create_time} -> Entity{createTime} -->
		<setting name="mapUnderscoreToCamelCase" value="true" />
		<!-- 打印查询语句 -->
		<setting name="logImpl" value="STDOUT_LOGGING" />
	</settings>
</configuration>]]
end
--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function(opts)
  local template = {
    { pattern = ".*Mapper.xml$", content = Mapper_template },
    { pattern = "spring.*%.xml", content = spring_template },
    { pattern = "mybatis-config.xml", content = mybatis_template },
  }

	return utils.find_entry(template, opts)
end
