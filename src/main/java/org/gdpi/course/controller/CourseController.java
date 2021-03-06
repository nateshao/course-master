package org.gdpi.course.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.gdpi.course.entity.Course;
import org.gdpi.course.entity.Teacher;
import org.gdpi.course.exception.CourseAlreadyExistedException;
import org.gdpi.course.reponse.SimpleResponse;
import org.gdpi.course.service.CourseService;
import org.gdpi.course.service.TeacherService;
import org.gdpi.course.util.BeanUtils;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * @author zhf
 */
@RestController
@RequestMapping("/tea")
public class CourseController {

    @Resource
    private CourseService courseService;
    @Resource
    private TeacherService teacherService;

    @GetMapping("/addCourse")
    public ModelAndView toAddCourse(ModelAndView mv){

        mv.addObject("types",courseService.findAllType());
        mv.setViewName("admin/course-add");
        return mv;
    }

    /**
     * 添加课程
     * @param course
     * @param result
     * @param userDetails
     * @return
     */
    @PostMapping("/course")
    public SimpleResponse addCourse(@RequestBody @Valid Course course,
                                    BindingResult result,
                                    @AuthenticationPrincipal UserDetails userDetails) {System.out.println(course.getTypeId());
        BeanUtils.trim(course);
        if (result.hasErrors()) {
            return SimpleResponse.error("创建失败");
        }

        try {
            courseService.addCourse(course, userDetails.getUsername());
        } catch (CourseAlreadyExistedException e) {
            return SimpleResponse.error("课程号已存在");
        }


        // 添加标签
        courseService.addTags(course.getTags(), course.getId());

        return SimpleResponse.success("创建成功");
    }

    /**
     * 分页查找课程
     * @param page
     * @param userDetails
     * @return
     */
    @GetMapping("/course")
    public SimpleResponse listCourse(@RequestParam(defaultValue = "1") Integer page,
                                     @AuthenticationPrincipal UserDetails userDetails) {
        // 先查出教师id
        Teacher teacher = teacherService.findByUsername(userDetails.getUsername());

        PageInfo<Object> pageInfo = PageHelper.startPage(page, 10)
                .doSelectPageInfo(() -> courseService.findByTeaId(teacher.getId()));

        return SimpleResponse.success(pageInfo);
    }

    /**
     * 查找所有课程
     * @param page
     * @param userDetails
     * @return
     */
    @GetMapping("/courses")
    public SimpleResponse getCourses(@RequestParam(defaultValue = "1") Integer page,
                                     @AuthenticationPrincipal UserDetails userDetails) {
        // 先查出教师id
        Teacher teacher = teacherService.findByUsername(userDetails.getUsername());

        List<Course> courses = courseService.findByTeaId(teacher.getId());

        return SimpleResponse.success(courses);
    }

    /**
     * 查找课程
     * @param id
     * @param userDetails
     * @return
     */
    @GetMapping("/course/{id:\\d+}")
    public SimpleResponse getCourse(@PathVariable Integer id,
                                    @AuthenticationPrincipal UserDetails userDetails) {
        // 先查出教师id
        Teacher teacher = teacherService.findByUsername(userDetails.getUsername());

        Course course = courseService.findByIdAndTeaId(id, teacher.getId());

        if (course == null) {
            return SimpleResponse.error("查询失败");
        }

        return SimpleResponse.success(course);
    }

    /**
     * 删除课程
     * @param id
     * @param userDetails
     * @return
     */
    @DeleteMapping("/course/{id:\\d+}")
    public SimpleResponse deleteCourse(@PathVariable Integer id,
                                       @AuthenticationPrincipal UserDetails userDetails) {

        Teacher tea = teacherService.findByUsername(userDetails.getUsername());
        Integer num = courseService.deleteByIdAndTeaId(id, tea.getId());
        if (num == 0) {
            return SimpleResponse.success("你没有该课程");
        }

        return SimpleResponse.success("删除成功");
    }

    /**
     * 修改课程
     * @param course
     * @param result
     * @param userDetails
     * @return
     */
    @PutMapping("/course")
    public SimpleResponse updateCourse(@RequestBody @Valid Course course,
                                       BindingResult result,
                                       @AuthenticationPrincipal UserDetails userDetails) {
        BeanUtils.trim(course);
        if (result.hasErrors()) {
            return SimpleResponse.error("修改不合法");
        }

        Teacher tea = teacherService.findByUsername(userDetails.getUsername());
        course.setTeaId(tea.getId());

        Integer num = courseService.updateCourse(course);

        if (num == 0) {
            return SimpleResponse.error("修改失败");
        }

        return SimpleResponse.success(course);

    }
}
