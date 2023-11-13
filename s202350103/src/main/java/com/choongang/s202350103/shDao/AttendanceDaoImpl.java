package com.choongang.s202350103.shDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.Attendance;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AttendanceDaoImpl implements AttendanceDao {

	private final SqlSession session;
	
	@Override
	public int totalAtt() {
		System.out.println("AttendanceDao totalAtt() Start..");
		int totalAtt = 0;
		try {
			totalAtt = session.selectOne("shTotalAtt");
		} catch (Exception e) {
			System.out.println("AttendanceDao totalAtt() Exception->"+e.getMessage());
		}
		return totalAtt;
	}

	@Override
	public List<Attendance> listEvent(Attendance attendance) {
		System.out.println("AttendanceDao listEvent Start..");
		List<Attendance> eventList = null;
		try {
			eventList = session.selectList("shEventList",attendance);
		} catch (Exception e) {
			System.out.println("AttendanceDao listEvent Exception->"+e.getMessage());
		}
		return eventList;
	}

	@Override
	public int divideAttNum(int eNum) {
		System.out.println("AttendanceDao divideAttNum() Start..");
		int num = 0;
		try {
			num = session.selectOne("shDivideAttNum", eNum);
		} catch (Exception e) {
			System.out.println("AttendanceDao divideAttNum() Exception->"+e.getMessage());
		}
		return num;
	}

	
	@Override
	public Attendance attendance(int eNum) {
		System.out.println("AttendanceDao listAttendance() Start..");
		Attendance attendance = null;
		try {
			attendance = session.selectOne("shAttendance",eNum);
		} catch (Exception e) {
			System.out.println("AttendanceDao listAttendance() Exception ->"+e.getMessage());
		}
		return attendance;
	}

	@Override
	public int startMonth(int eNum) {
		System.out.println("AttendanceDao startMonth() Start..");
		int sMonth = 0;
		try {
			sMonth = session.selectOne("shStartMonth",eNum);
		} catch (Exception e) {
			System.out.println("AttendanceDao startMonth() Exception ->"+e.getMessage());
		}
		return sMonth;
	}

	@Override
	public int startYear(int eNum) {
		System.out.println("AttendanceDao startYear() Start..");
		int sYear = 0;
		try {
			sYear = session.selectOne("shStartYear",eNum);
		} catch (Exception e) {
			System.out.println("AttendanceDao startYear() Exception ->"+e.getMessage());
		}
		return sYear;
	}

	@Override
	public int createAtt(Attendance attendance) {
		System.out.println("AttendanceDao createAtt() Start..");
		int result = 0;
		try {
			result = session.insert("shCreateAtt",attendance);
		} catch (Exception e) {
			System.out.println("AttendanceDao createAtt() Exception ->"+e.getMessage());
		}
		return result;
	}

	@Override
	public List<Attendance> boEventList(Attendance attendance) {
		System.out.println("AttendanceDao boEventList() Start..");
		List<Attendance> attendanceList = null;
		try {
			attendanceList = session.selectList("shBoEventList");
		} catch (Exception e) {
			System.out.println("AttendanceDao boEventList() Exception ->"+e.getMessage());
		}
		return attendanceList;
	}

	@Override
	public int updateAttendance(Attendance attendance) {
		System.out.println("AttendanceDao updateAttendance() Start..");
		int result = 0;
		try {
			result = session.update("shUpdateAttendance",attendance);
		} catch (Exception e) {
			System.out.println("updateAttendance Exception ->"+e.getMessage());
		}
		return result;
	}

	@Override
	public List<Attendance> searchEvent(Attendance attendance) {
		System.out.println("AttendanceDao searchEvent() Start..");
		List<Attendance> boEventList = null;
		try {
			boEventList = session.selectList("shBoSearchEvent",attendance);
		} catch (Exception e) {
			System.out.println("AttendanceDao searchEvent() Exception->"+e.getMessage());
		}
		return boEventList;
	}

}
