package cn.mldn.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import cn.mldn.vo.Dept;

public interface IDeptService {
	/**
	 * 进行数据的批量删除处理
	 * @param ids 要删除的数据编号
	 * @return
	 * @throws Exception
	 */
	public boolean delete(Set<Integer> ids) throws Exception ;
	/**
	 * 进行部门信息修改前的数据查询操作
	 * @param id 要修改的部门编号
	 * @return 部门信息
	 * @throws Exception
	 */ 
	public Dept getEditPre(int id) throws Exception ;
	/**
	 * 进行部门数据的修改，调用IDeptDAO.doUpdate()方法
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean edit(Dept vo) throws Exception ;
	/**
	 * 进行所有部门数据的统计查询操作，该操作要执行两个方法调用：<br>
	 * 1、调用IDeptDAO.findAll()方法查询出所有部门的基本信息；<br>
	 * 2、调用IDeptDAO.findAllStat()方法进行部门信息的统计；<br>
	 * @return 返回的数据有两类：List<Dept>、Map<Integer,Map<String,Object>>，所以使用Map，包括的key信息如下：<br>
	 * key = allDepts、value = IDeptDAO.findAll()返回结果；<br>
	 * key = deptStats、value = IDeptDAO.findAllStat()返回结果。
	 * @throws Exception
	 */
	public Map<String,Object> listDetails() throws Exception ;
	/**
	 * 进行部门数据的追加操作，该操作按照如下步骤执行：<br>
	 * 1、首先使用IDeptDAO.findById()查询要追加的部门编号是否存在；<br>
	 * 2、如果部门编号不存在使用IDeptDAO.doCreate()进行部门数据保存
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean add(Dept vo) throws Exception ;
	/**
	 * 列出全部部门的基本信息
	 * @return
	 * @throws Exception
	 */
	public List<Dept> list() throws Exception ;
}
